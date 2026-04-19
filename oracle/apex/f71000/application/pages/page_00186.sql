prompt --application/pages/page_00186
begin
wwv_flow_api.create_page(
 p_id=>186
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Gesti\00F3n de Revocatoria de Acuerdos de Pago')
,p_step_title=>unistr('Gesti\00F3n de Revocatoria de Acuerdos de Pago')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#APP_IMAGES#jszip.min.js',
'#APP_IMAGES#pdf-lib.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function seleccionarTodos(e, btn, grid, datos){  ',
'  v_json = datos.map((m) => {',
'      return { ',
'          "ID_ACTO": m["ID_ACTO"],',
'          "ESTADO": m["CDGO_CNVNIO_RVCTRIA_ESTDO"]',
'      } ',
'  }).filter((data) => { return data.ESTADO !== ''RGS''}); // Json donde se guardan los seleccionados',
'',
'  localStorage.setItem("datosImprimir", JSON.stringify(v_json)); // Se almacena en el localstorage',
'  ',
'  if(v_json.length > 0) {',
'    apex.item("BTN_IMPRIMIR_2").show() ',
'    if (v_json.length > 1){',
'      apex.item("BTN_IMPRIMIR_1").show() ',
'    }',
'  } else {',
'    apex.item("BTN_IMPRIMIR_1").hide();',
'    apex.item("BTN_IMPRIMIR_2").hide();',
'  }',
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
'    zip.file(`Gestion_revocatoria_Acuerdos_Pago.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Gestion_revocatoria_Acuerdos_Pago_masivo.zip`, ''application/zip'');',
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
'        zip.file(`REV${data[j].fileName}.pdf`, file);',
'        contador++;',
'        j++;',
'      }',
'      respData = respData.concat(data)',
'      i = i + 20;',
'    }',
'      ',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Gestion_revocatoria_Acuerdos_Pago_individual.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''BTN_APLICAR_REVOCATORIA'').hide();',
'apex.item(''BTN_ANULAR_REVOCATORIA'').hide();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IG-controlsContainer {',
'    display: none;',
'}',
''))
,p_step_template=>wwv_flow_api.id(177318575824050591)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_api.id(177374633629050691)
,p_last_updated_by=>'JPRADA'
,p_last_upd_yyyymmddhh24miss=>'20220323170309'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(107327245579578401)
,p_plug_name=>'Solicitudes Revocatoria'
,p_region_name=>'solicitudesRevocar'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.id_cnvnio_rvctria',
'        , a.id_cnvnio',
'        , a.nmro_cnvnio',
'        , to_char(a.fcha_rgstro, ''DD/MM/YYYY HH:MI AM'')                     fcha_rgstro',
'        , a.idntfccion_sjto ',
'        , a.nmbre_slctnte',
'        , initcap(a.dscrpcion_cnvnio_rvctria_estdo)                            dscrpcion_cnvnio_rvctria_estdo',
'        , nvl(a.id_acto_anlcion,a.id_acto)                                     id_acto',
'        , b.id_rprte                   ',
'        , a.nmbre_impsto_sbmpsto                 ',
'        , a.cdgo_cnvnio_rvctria_estdo                 ',
'        , ''ACTO_REV_''|| a.nmro_cnvnio                                          nmbre_rprte',
'        , c.nmro_acto                 ',
unistr('        , decode (c.indcdor_ntfccion, ''S'', ''S\00ED'', ''N'', ''No'')                    dscrpcion_indcdor_ntfccion'),
'        , c.fcha_ntfccion         ',
'        , d.id_instncia_fljo_hjo',
'     from v_gf_g_convenios_revocatoria    a                 ',
'     join gf_g_convenios_documentos       b on a.id_cnvnio                     = b.id_cnvnio ',
'      and a.id_acto = b.id_acto',
'     join gn_g_actos                      c on c.id_acto                       = b.id_acto   ',
'     join gf_g_convenios                  d on a.id_cnvnio                     = d.id_cnvnio',
'    where a.cdgo_clnte                    = :F_CDGO_CLNTE',
'      and (a.id_impsto                    = :P186_ID_IMPSTO                    or :P186_ID_IMPSTO is null)',
'      and (a.id_impsto_sbmpsto            = :P186_ID_IMPSTO_SBMPSTO            or :P186_ID_IMPSTO_SBMPSTO is null)',
'      and a.cdgo_cnvnio_estdo             in (''APL'', ''RVC'')',
'      and (a.id_cnvnio_tpo                = :P186_ID_CNVNIO_TPO)',
'      and (a.cdgo_cnvnio_rvctria_estdo    = :P186_CDGO_CNVNIO_RVCTRIA_ESTDO    or :P186_CDGO_CNVNIO_RVCTRIA_ESTDO is null)',
'      and ((trunc(a.fcha_rgstro)          between :P186_FCHA_INCIO             and :P186_FCHA_FNAL)    or',
'         (trunc(a.fcha_rgstro)            >= :P186_FCHA_INCIO                  and :P186_FCHA_FNAL is null) or',
'         (trunc(a.fcha_rgstro)            <= :P186_FCHA_FNAL                   and :P186_FCHA_INCIO is null)or ',
'         (:P186_FCHA_INCIO                is null                              or :P186_FCHA_FNAL is null));'))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(18251169821063502)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sujeto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>230
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
 p_id=>wwv_flow_api.id(26434744627180702)
,p_name=>'CDGO_CNVNIO_RVCTRIA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_CNVNIO_RVCTRIA_ESTDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(26434824759180703)
,p_name=>'FCHA_RGSTRO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_RGSTRO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha <br>Registro'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>170
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_is_required=>false
,p_max_length=>19
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
 p_id=>wwv_flow_api.id(56880607421055021)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00B0 Acto <br>Revocatoria')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(76088221602885001)
,p_name=>'DSCRPCION_INDCDOR_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_INDCDOR_NTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('\00BFActo <br>Notificado?')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(76088323992885002)
,p_name=>'FCHA_NTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_NTFCCION'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>unistr('Fecha de <br>Notificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
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
 p_id=>wwv_flow_api.id(94856513028060702)
,p_name=>'ID_INSTNCIA_FLJO_HJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO_HJO'
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
 p_id=>wwv_flow_api.id(107376346990063003)
,p_name=>'NMRO_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_CNVNIO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>unistr('N\00B0 Acuerdo')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:283:&SESSION.::&DEBUG.:RP,283:P283_BRANCH,P283_ID_CNVNIO,P283_ID_INSTNCIA_FLJO:&APP_PAGE_ID.,&ID_CNVNIO.,&ID_INSTNCIA_FLJO_HJO.'
,p_link_text=>'&NMRO_CNVNIO.'
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
 p_id=>wwv_flow_api.id(107376619301063006)
,p_name=>'NMBRE_SLCTNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SLCTNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Solicitante'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>404
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
 p_id=>wwv_flow_api.id(108299950424689801)
,p_name=>'ID_CNVNIO_RVCTRIA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO_RVCTRIA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
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
 p_id=>wwv_flow_api.id(108300217579689804)
,p_name=>'DSCRPCION_CNVNIO_RVCTRIA_ESTDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_CNVNIO_RVCTRIA_ESTDO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Estado'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'CENTER'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
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
 p_id=>wwv_flow_api.id(108300760143689809)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_enable_hide=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108421131945125501)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
,p_value_alignment=>'CENTER'
,p_link_target=>'f?p=&APP_ID.:186:&SESSION.:DOWNLOAD:&DEBUG.:RP:P186_ID_ACTO:&ID_ACTO.'
,p_link_text=>'<center><span class="fa fa-cloud-download fa-1x fa-spin"></span></center>'
,p_enable_filter=>true
,p_filter_is_required=>false
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
,p_escape_on_http_output=>true
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108471662086379201)
,p_name=>'NMBRE_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_RPRTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
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
 p_id=>wwv_flow_api.id(108471885560379203)
,p_name=>'ID_RPRTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_RPRTE'
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
 p_id=>wwv_flow_api.id(108622328017629101)
,p_name=>'VER'
,p_source_type=>'NONE'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(108710819218949003)
,p_name=>'ID_CNVNIO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNVNIO'
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
 p_id=>wwv_flow_api.id(119357449729894526)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub - Tributo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(107376191467063001)
,p_internal_uid=>107376191467063001
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
'    config.initialSelection = false; ',
'    return selectAll(config, {',
'        name: ''Todos'',',
'        action: seleccionarTodos,',
'        hot:false',
'    });',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(107382014849064849)
,p_interactive_grid_id=>wwv_flow_api.id(107376191467063001)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(107382107712064849)
,p_report_id=>wwv_flow_api.id(107382014849064849)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(8740158429079)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(76088221602885001)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9256448429084)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(76088323992885002)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(18258957438114312)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(18251169821063502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>236
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26530187877595359)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(26434744627180702)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(26606694208730363)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(26434824759180703)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>149
,p_sort_order=>1
,p_sort_direction=>'DESC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(56944968170284793)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(56880607421055021)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(94872087521294512)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>19
,p_column_id=>wwv_flow_api.id(94856513028060702)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107383117824064864)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(107376346990063003)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>121
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(107384644371064869)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(107376619301063006)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>202
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108305906557690232)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(108299950424689801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108307426299690239)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(108300217579689804)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108427136417125770)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(108421131945125501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108477510218379383)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(108471662086379201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108498113588388476)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>15
,p_column_id=>wwv_flow_api.id(108471885560379203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108627643059633691)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(108622328017629101)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(108742436945225228)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(108710819218949003)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(119469606145162546)
,p_view_id=>wwv_flow_api.id(107382107712064849)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(119357449729894526)
,p_is_visible=>false
,p_is_frozen=>true
,p_width=>199
,p_break_order=>5
,p_break_is_enabled=>true
,p_break_sort_direction=>'ASC'
,p_break_sort_nulls=>'LAST'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(158340289090776237)
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
 p_id=>wwv_flow_api.id(202364304701284102)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>20
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
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(248439658543993621)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5><b><center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></center></i> </b></h5>',
'',
'<i>',
'    Esta funcionalidad permite<br><br>',
unistr('    <b>1.</b> Consultar el proceso de revocatoria de acuerdo(s) de pago, a trav\00E9s de los estados.<br><br>'),
unistr('    <b>2.</b> Descargar acto de revocatoria o anulaci\00F3n de revocatoria seg\00FAn el estado en que se encuentre.<br><br>'),
unistr('    <p align="justify">Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</p>'),
'</i> '))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107344675114694327)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(202364304701284102)
,p_button_name=>'BTN_APLICAR_REVOCATORIA'
,p_button_static_id=>'BTN_APLICAR_REVOCATORIA'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Aplicar Revocatoria'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'javascript:apex.confirm(''Â¿EstÃ¡ Seguro de Aplicar Revocatoria de Acuerdo(s) de Pago?'', ''BTN_APLICAR_REVOCATORIA'');'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-window-check'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9964593947044502)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(202364304701284102)
,p_button_name=>'BTN_IMPRIMIR_ACTOS_CONSOLIDADOS'
,p_button_static_id=>'BTN_IMPRIMIR_1'
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
 p_id=>wwv_flow_api.id(9964874159044505)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(202364304701284102)
,p_button_name=>'BTN_IMPRIMIR_ACTOS_PUNTUALES'
,p_button_static_id=>'BTN_IMPRIMIR_2'
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
 p_id=>wwv_flow_api.id(107344291989694327)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(202364304701284102)
,p_button_name=>'BTN_ANULAR_REVOCATORIA'
,p_button_static_id=>'BTN_ANULAR_REVOCATORIA'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_image_alt=>'Anular Revocatoria'
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select 1',
'     from gf_d_revocatoria_metodo    a',
'     join gf_d_convenios_tipo        b on a.id_rvctria_mtdo = b.id_rvctria_mtdo',
'    where a.cdgo_clnte               = :F_CDGO_CLNTE',
'      and a.indcdor_vlda_pgo_cta     = ''S''',
'      and b.id_cnvnio_tpo            = :P186_ID_CNVNIO_TPO;'))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-window-x'
,p_grid_new_grid=>false
);
end;
/
begin
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(107357434557950017)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(158340289090776237)
,p_button_name=>'BTN_BUSCAR'
,p_button_static_id=>'BTN_BUSCAR'
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(113732061240193402)
,p_branch_name=>unistr('Ir a la p\00E1gina 211')
,p_branch_action=>'f?p=&APP_ID.:211:&SESSION.::&DEBUG.:RP,211::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(107344291989694327)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47153797691556512)
,p_name=>'P186_ID_IMPSTO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(158340289090776237)
,p_prompt=>'<b>Tributo</b>'
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
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tributo asociado a la revocatoria de acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(47153849130556513)
,p_name=>'P186_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(158340289090776237)
,p_prompt=>'<b>Sub Tributo</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_impsto_sbmpsto d ',
'       ,id_impsto_sbmpsto r       ',
'  from df_i_impuestos_subimpuesto',
'  where cdgo_clnte = :F_CDGO_CLNTE',
'    and id_impsto = :P186_ID_IMPSTO',
'    and actvo = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P186_ID_IMPSTO'
,p_ajax_items_to_submit=>'P186_ID_IMPSTO_SBMPSTO,P186_ID_IMPSTO'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el sub tributo asociado a la revocatoria de acuerdo de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54496137480673002)
,p_name=>'P186_ID_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(158340289090776237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107357839430950019)
,p_name=>'P186_ID_CNVNIO_TPO'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(158340289090776237)
,p_prompt=>'<b>Tipo de Acuerdo de Pago</b>'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       ID_CNVNIO_TPO as r',
'  from gf_d_convenios_tipo    ',
' where cdgo_clnte          = :F_CDGO_CLNTE',
'   and (cdgo_sjto_tpo       = :P186_CDGO_SJTO_TPO or :P186_CDGO_SJTO_TPO IS NULL)',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_value=>'-- Seleccione un Tipo de Acuerdo de Pago--'
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el tipo de acuerdo de pago asociado a los acuerdos de pago en proceso de revocatoria.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107358662367950024)
,p_name=>'P186_CDGO_CNVNIO_RVCTRIA_ESTDO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(158340289090776237)
,p_prompt=>'<b>Estado Revocatoria</b>'
,p_source=>'RGS'
,p_source_type=>'STATIC'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_CNVNIO_RVCTRIA_ESTDO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(dscrpcion) as d,',
'       cdgo_cnvnio_rvctria_estdo as r',
'  from gf_d_cnvnios_rvctria_estdo',
' order by 1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Seleccione un estado -- '
,p_begin_on_new_line=>'N'
,p_grid_column=>10
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Seleccione el estado en que se encuentra el proceso de revocatoria para el cual desea listar los acuerdos de pago.'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'70%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107359856601950024)
,p_name=>'P186_FCHA_INCIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(158340289090776237)
,p_prompt=>'<b>Fecha Inicial - Registro</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>6
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00EDnima del rango, correspondiente al registro de la revocatoria de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(107360222286950024)
,p_name=>'P186_FCHA_FNAL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(158340289090776237)
,p_prompt=>'<b>Fecha Final - Registro</b>'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_tag_attributes=>'onkeydown="return false" onfocus="this.value=''''" '
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>wwv_flow_api.id(177355241449050629)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>unistr('Ingrese fecha m\00E1xima del rango, correspondiente al registro de la revocatoria de acuerdo de pago.')
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'MONTH_AND_YEAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(108406467495047602)
,p_name=>'P186_ID_CNVNIO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(107327245579578401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(110612957762117304)
,p_name=>'P186_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(158340289090776237)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(118878214836593301)
,p_validation_name=>'Convenios Seleccionados'
,p_validation_sequence=>10
,p_validation=>'P186_ID_CNVNIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('\00A1Seleccione Acuerdo(s) de Pago!')
,p_validation_condition=>'BTN_APLICAR_REVOCATORIA,BTN_ANULAR_REVOCATORIA'
,p_validation_condition_type=>'REQUEST_IN_CONDITION'
,p_associated_item=>wwv_flow_api.id(108406467495047602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(108710651593949001)
,p_name=>'Al Seleccionar Registro'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(107327245579578401)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(108710731299949002)
,p_event_id=>wwv_flow_api.id(108710651593949001)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var records = this.data.selectedRecords;',
'apex.item(''BTN_APLICAR_REVOCATORIA'').hide();',
'apex.item(''BTN_ANULAR_REVOCATORIA'').hide();',
'apex.item("BTN_IMPRIMIR_1").hide();',
'apex.item("BTN_IMPRIMIR_2").hide();',
'',
'if(records.length > 0){',
'  let model = this.data.model;',
'  console.log(''entre'', model);',
'   let v_json = records.map(function(record){',
'      return { ',
'              "ID_ACTO": model.getValue(record, "ID_ACTO").trim(),',
'              "ESTADO": model.getValue(record, "CDGO_CNVNIO_RVCTRIA_ESTDO").trim()',
'             }',
'      }).filter((data) => { return data.ESTADO !== ''RGS''});',
'     console.log(''pase por aqui!!!'', v_json)',
'    localStorage.setItem("datosImprimir", JSON.stringify(v_json));',
'  ',
'  if(v_json.length > 0) {',
'    apex.item("BTN_IMPRIMIR_2").show() ',
'    if (v_json.length > 1){',
'      apex.item("BTN_IMPRIMIR_1").show() ',
'    }',
'  } else {',
'    apex.item("BTN_IMPRIMIR_1").hide();',
'    apex.item("BTN_IMPRIMIR_2").hide();',
'  }',
'}',
'',
'if(records.length > 0){',
'    var model = this.data.model;',
'    // crea un array de objetos de estados y luego trae otro sin objetos iguales',
'    var estados = records.map(function(record){',
'        return model.getValue(record, ''CDGO_CNVNIO_RVCTRIA_ESTDO'');',
'    }).filter( function (obj, pos, record){',
'        return (record.indexOf(obj) === pos)',
'    });',
'    // valida que exista un unico estado seleccionado',
'    if(estados.length === 1){        ',
'        records = records.filter(function (record){',
'            return (model.getValue(record, ''CDGO_CNVNIO_RVCTRIA_ESTDO'') == ''RGS'')',
'        });',
'',
'        var json = records.map(function (record){',
'            return {''ID_CNVNIO'': model.getValue(record, ''ID_CNVNIO'')};',
'        });',
'        ',
'        // valida si hay registros seleccionados',
'        if(json.length > 0){   ',
'            $s(''P186_ID_CNVNIO'', JSON.stringify(json));',
'            if (records.length > 0){',
'                apex.item(''BTN_APLICAR_REVOCATORIA'').show();',
'                apex.item(''BTN_ANULAR_REVOCATORIA'').show();',
'            }',
'        }',
'    }',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(110615359491117328)
,p_name=>'Cerrar Modal'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'body'
,p_bind_type=>'bind'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'dialogclose'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(110615454769117329)
,p_event_id=>wwv_flow_api.id(110615359491117328)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_api.id(107327245579578401)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9964670474044503)
,p_name=>'Al dar click en BTN_IMPRMIR_1'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(9964593947044502)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9964732309044504)
,p_event_id=>wwv_flow_api.id(9964670474044503)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9964916533044506)
,p_name=>'Al dar click en BTN_IMPRMIR_2'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(9964874159044505)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9965093465044507)
,p_event_id=>wwv_flow_api.id(9964916533044506)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_2()'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(110612855725117303)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Aplicar Revocatoria Acuerdo de Pago'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta    number;',
'begin',
'    pkg_gf_convenios.prc_ap_rvctria_acrdo_pgo_msvo( p_cdgo_clnte     		=>    :F_CDGO_CLNTE,',
'                                                    p_json_cnvnio    		=>    :P186_ID_CNVNIO,',
'                                                    p_id_usrio       		=>    :F_ID_USRIO,',
'                                                    o_cdgo_rspsta    		=>    v_cdgo_rspsta,',
'                                                    o_mnsje_rspsta   		=>    :P186_RSPSTA);',
'end;'))
,p_process_error_message=>'#SQLERRM#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(107344675114694327)
,p_process_success_message=>'&P186_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54496072865673001)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Descargar '
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta',
'declare',
'    v_file_name varchar2(2000);',
'    v_file_blob blob;',
'    v_file_mimetype varchar2(1000);',
'begin',
'    select file_name',
'         , file_mimetype',
'         , file_blob',
'      into v_file_name',
'         , v_file_mimetype ',
'         , v_file_blob',
'      from v_gn_g_actos ',
'     where id_acto = :P186_ID_ACTO; ',
'    if(v_file_blob is not null and v_file_name is not null and v_file_mimetype is not null)then',
'        htp.init;',
'        owa_util.mime_header(v_file_mimetype, FALSE );',
'        htp.p(''Content-length: '' ||dbms_lob.getlength(v_file_blob));',
'        htp.p(''Content-Disposition: attachment; filename="'' ||v_file_name || ''"'' );',
'        htp.p(''Cache-Control: max-age=0'');  -- tell the browser to cache for one hour, adjust as necessary',
'        owa_util.http_header_close;',
'        wpg_docload.download_file(v_file_blob);',
'        apex_application.stop_apex_engine;',
'    end if;',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DOWNLOAD'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9964484959044501)
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
