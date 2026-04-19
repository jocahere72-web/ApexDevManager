prompt --application/pages/page_00188
begin
wwv_flow_api.create_page(
 p_id=>188
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n de Oficios de Incumplimiento')
,p_step_title=>unistr('Gesti\00F3n de Oficios de Incumplimiento')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#APP_IMAGES#jszip.min.js',
'#APP_IMAGES#pdf-lib.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccionarTodos(e, btn, grid, datos){  ',
'  v_json = datos.map((m) => {',
'      return { ',
'          "ID_ACTO": m["ID_ACTO"] ',
'      } ',
'  }).filter((data) => { return data.ESTADO !== ''RGS''}); // Json donde se guardan los seleccionados',
'',
'  localStorage.setItem("datosImprimir", JSON.stringify(v_json)); // Se almacena en el localstorage',
'  ',
'  if(v_json.length > 0) {',
'    apex.item("BTN_IMPRIMIR_ACTOS_MASIVOS").show() ',
'    if (v_json.length > 1){',
'      apex.item("BTN_IMPRIMIR_ACTOS_CONSOLIDADOS").show() ',
'    }',
'  } else {',
'    apex.item("BTN_IMPRIMIR_ACTOS_CONSOLIDADOS").hide();',
'    apex.item("BTN_IMPRIMIR_ACTOS_MASIVOS").hide();',
'  }',
'}',
'',
' ',
'function allFlujos(e,btn,ig, data){',
'   ',
'    var jsonFlujos = data.map((flujo) => {',
'        return {',
'            "ID_ACTO": flujo.ID_ACTO ',
'        }; ',
'    });',
'    ',
'    window.localStorage.setItem(''jsonFlujos'', JSON.stringify(jsonFlujos));',
'}',
'',
'/**********************************************************************************************',
'**********************************GENERACION DE DOCUMENTOS*************************************',
'***********************************************************************************************/',
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
'const merge = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let v_json = localStorage.getItem(''datosImprimir'');',
'  let array = JSON.parse(v_json);',
'  array.sort((a,b)=>{return a[''ID_ACTO'']-b[''ID_ACTO'']})',
'  let arrayString = JSON.stringify(array);',
'  let cantidad = array.length;',
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
'    let zip = new JSZip();',
'    zip.file(`Acto_incumplimiento.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Acto_incumplimiento_masivo.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  console.log(''1. SALE IF'');',
'  popup.remove();',
'}',
'',
'const merge_2 = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''datosImprimir'');',
'  let contentJson = JSON.parse(v_json)',
'  let array = JSON.parse(v_json);',
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
'        zip.file(`OF_INCUMPLIMIENTO${data[j].fileName}.pdf`, file);',
'        contador++;',
'        j++;',
'      }',
'      respData = respData.concat(data)',
'      i = i + 20;',
'    }',
'      ',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Acto_incumplimiento_individual.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//ocultarAyudaD();',
'apex.region("incumplimientos").widget().interactiveGrid("setSelectedRecords", []);'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220325164106'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(21456956156481818)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'    Esta funcionalidad permite<br><br>',
'    <b>1.</b> Consultar los oficios de incumplimiento generados por el sistema.<br><br>',
'    <b>2.</b> Ver y/o descargar el oficio de incumplimiento de acuerdo(s) de pago.<br><br>',
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108753091768287701)
,p_plug_name=>unistr('<b>Par\00E1metros de B\00FAsqueda</b>')
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177327797946050606)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(108753161805287702)
,p_plug_name=>'Actos de Incumplimientos'
,p_region_name=>'incumplimientos'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(177332491179050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_cnvnio_incmplmnto,',
'        a.nmbre_impsto,',
'        a.dscrpcion_cnvnio_tpo,',
'        a.nmro_cnvnio,',
'        a.dscrpcion_cnvnio_estdo,',
'        a.nmro_cta,',
'        a.idntfccion_sjto,',
'        a.fcha,',
'        a.nmro_acto_dsplay,',
'        a.dscrpcion_indcdor_ntfcdo,',
'        a.nmro_acto,',
'        a.id_acto,',
'        a.cdgo_cnvnio_estdo estado,',
'        a.id_cnvnio',
'   from v_gf_g_convenios_incmplmnto a',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.id_acto is not null',
'    and a.cdgo_cnvnio_estdo = ''APL''',
'    and (a.id_cnvnio_tpo = :P188_ID_CNVNIO_TPO or :P188_ID_CNVNIO_TPO is null)',
'    and (a.idntfccion_sjto = :P188_INDTFCCION_SJTO or :P188_INDTFCCION_SJTO is null)',
'    and (a.nmro_cnvnio = :P188_NMRO_CNVNIO or :P188_NMRO_CNVNIO is null)',
'    and ((trunc(a.fcha) between :P188_FCHA_INCIO and :P188_FCHA_FIN)',
'        or (trunc(a.fcha) >= :P188_FCHA_INCIO and :P188_FCHA_FIN is null) ',
'        or (trunc(a.fcha) <= :P188_FCHA_FIN and :P188_FCHA_INCIO  is null)',
'        or (:P188_FCHA_INCIO is null and :P188_FCHA_FIN is null ))    ',
'    and (a.nmro_acto_dsplay like ''%''||:P188_NMRO_ACTO ||''%'')',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21455321638481802)
,p_name=>'ID_CNVNIO_INCMPLMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO_INCMPLMNTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Cnvnio Incmplmnto'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
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
 p_id=>wwv_flow_api.id(21455453867481803)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(21455565577481804)
,p_name=>'DSCRPCION_CNVNIO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Tipo de Acuerdo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(21455644783481805)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'No. Acuerdo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(21455769324481806)
,p_name=>'DSCRPCION_CNVNIO_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(21455848418481807)
,p_name=>'NMRO_CTA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CTA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Cuotas'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(21456056112481809)
,p_name=>'FCHA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>true
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
 p_id=>wwv_flow_api.id(21456135461481810)
,p_name=>'NMRO_ACTO_DSPLAY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO_DSPLAY'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Nmro Acto Dsplay'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
 p_id=>wwv_flow_api.id(21456264434481811)
,p_name=>'DSCRPCION_INDCDOR_NTFCDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_NTFCDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFNotificado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>110
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
 p_id=>wwv_flow_api.id(21456387267481812)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(21456497281481813)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21457127074481820)
,p_name=>'ESTADO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESTADO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Estado'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attribute_05=>'BOTH'
,p_is_required=>true
,p_max_length=>5
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
 p_id=>wwv_flow_api.id(21457376545481822)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Oficio'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
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
 p_id=>wwv_flow_api.id(21457672392481825)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Id Cnvnio'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_api.id(21457912719481828)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n <br> Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(21455255748481801)
,p_internal_uid=>21455255748481801
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
'',
'function(config) {',
'    config.initialSelection = false; ',
'    return selectAll(config, {',
'        name: ''Todos'',',
'        action: seleccionarTodos,',
'        hot:false',
'    });',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(21461143323484867)
,p_interactive_grid_id=>wwv_flow_api.id(21455255748481801)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(21461230953484867)
,p_report_id=>wwv_flow_api.id(21461143323484867)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21461773008484871)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(21455321638481802)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21462242392484875)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(21455453867481803)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>245
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21462772888484877)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(21455565577481804)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>202
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21463282703484879)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(21455644783481805)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21463705039484881)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(21455769324481806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21464200692484882)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(21455848418481807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>253.992
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21465292414484885)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(21456056112481809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21465710646484887)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(21456135461481810)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21466227538484889)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(21456264434481811)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>51
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21466786877484890)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(21456387267481812)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21486128263665595)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(21457127074481820)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21487685937718221)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>12
,p_column_id=>wwv_flow_api.id(21457376545481822)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>152.719
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21491814474802465)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(21457672392481825)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21524875391443682)
,p_view_id=>wwv_flow_api.id(21461230953484867)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(21457912719481828)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>175.277
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(109068114197594108)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21479883151552456)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(109068114197594108)
,p_button_name=>'BTN_IMPRIMIR_ACTOS_CONSOLIDADOS'
,p_button_static_id=>'BTN_IMPRIMIR_ACTOS_CONSOLIDADOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Descargar Actos Masivos <br>Consolidados'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(21480135486554112)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(109068114197594108)
,p_button_name=>'BTN_IMPRIMIR_ACTOS_MASIVOS'
,p_button_static_id=>'BTN_IMPRIMIR_ACTOS_MASIVOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Descargar Actos Masivos <br>Puntuales'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-download'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(108753790273287708)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_api.id(108753091768287701)
,p_button_name=>'BTN_CONSULTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108753245515287703)
,p_name=>'P188_ID_CNVNIO_TPO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(108753091768287701)
,p_prompt=>'<b>Tipo de Acuerdo<br> de Pago</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CONVENIO_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tipo de los acuerdos de pago, a los cuales se les haya generado oficios de incumplimiento.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'90%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108753477381287705)
,p_name=>'P188_INDTFCCION_SJTO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(108753091768287701)
,p_prompt=>unistr('<b>Identificaci\00F3n Sujeto</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>25
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese la identificaci\00F3n del sujeto al cual le fue generado oficios de incumplimiento.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108753587075287706)
,p_name=>'P188_FCHA_INCIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(108753091768287701)
,p_prompt=>'<b>Fecha Inicio<br> Oficio</b> '
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente al registro del Oficio de incumplimiento de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108753679421287707)
,p_name=>'P188_FCHA_FIN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(108753091768287701)
,p_prompt=>'<b>Fecha Fin<br> Oficio</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>20
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente al registro del oficio de incumplimiento de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109067531878594102)
,p_name=>'P188_NMRO_CNVNIO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(108753091768287701)
,p_prompt=>unistr('<b>N\00B0 Acuerdo</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Dig\00EDte el n\00FAmero de acuerdo de pago para detallar oficios de incumplimiento generados.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
end;
/
begin
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(109067678493594103)
,p_name=>'P188_NMRO_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(108753091768287701)
,p_prompt=>unistr('<b>N\00B0 Oficio</b>')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>10
,p_tag_attributes=>'onkeypress="return validarExpresion(event, ''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese el n\00FAmero del oficio que se desea consultar.')
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21456555547481814)
,p_name=>'Al dar click en BTN_IMPRIMIR_ACTOS_CONSOLIDADOS'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(21479883151552456)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21456674985481815)
,p_event_id=>wwv_flow_api.id(21456555547481814)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21456745612481816)
,p_name=>'Al dar click en  BTN_IMPRIMIR_ACTOS_MASIVOS'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(21480135486554112)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21456831110481817)
,p_event_id=>wwv_flow_api.id(21456745612481816)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_2()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(21457712217481826)
,p_name=>'Al Seleccionar Registro'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(108753161805287702)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(21457868189481827)
,p_event_id=>wwv_flow_api.id(21457712217481826)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var records = this.data.selectedRecords; ',
'apex.item("BTN_IMPRIMIR_ACTOS_CONSOLIDADOS").hide();',
'apex.item("BTN_IMPRIMIR_ACTOS_MASIVOS").hide();',
'',
'if(records.length > 0){',
'  let model = this.data.model;',
'  console.log(''entre'', model);',
'   let v_json = records.map(function(record){',
'      return { ',
'              "ID_ACTO": model.getValue(record, "ID_ACTO").trim(),',
'              "ESTADO": model.getValue(record, "ESTADO").trim()',
'             }',
'      }).filter((data) => { return data.ESTADO !== ''RGS''});',
'     console.log(''pase por aqui!!!'', v_json)',
'    localStorage.setItem("datosImprimir", JSON.stringify(v_json));',
'  ',
'  if(v_json.length > 0) {',
'    apex.item("BTN_IMPRIMIR_ACTOS_MASIVOS").show() ',
'    if (v_json.length > 1){',
'      apex.item("BTN_IMPRIMIR_ACTOS_CONSOLIDADOS").show() ',
'    }',
'  } else {',
'    apex.item("BTN_IMPRIMIR_ACTOS_CONSOLIDADOS").hide();',
'    apex.item("BTN_IMPRIMIR_ACTOS_MASIVOS").hide();',
'  }',
'}',
'',
'if(records.length > 0){',
'    var model = this.data.model;',
'    // crea un array de objetos de estados y luego trae otro sin objetos iguales',
'    var estados = records.map(function(record){',
'        return model.getValue(record, ''ESTADO'');',
'    }).filter( function (obj, pos, record){',
'        return (record.indexOf(obj) === pos)',
'    });',
'    // valida que exista un unico estado seleccionado',
'    if(estados.length === 1){        ',
'        records = records.filter(function (record){',
'            return (model.getValue(record, ''ESTADO'') == ''RGS'')',
'        });',
'',
'        var json = records.map(function (record){',
'            return {''ID_CNVNIO'': model.getValue(record, ''ID_CNVNIO'')};',
'        });',
'        ',
'    }',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21458109725481830)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(108753161805287702)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Actos de Incumplimientos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(21457234372481821)
,p_process_sequence=>10
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
'  -- Se llena el json',
'  for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json := v_json || APEX_APPLICATION.g_f01(i);',
'  end loop;',
'  ',
'  ',
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''data''); --  , "data":[',
'  ',
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
