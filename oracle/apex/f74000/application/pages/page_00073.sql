prompt --application/pages/page_00073
begin
wwv_flow_api.create_page(
 p_id=>73
,p_user_interface_id=>wwv_flow_api.id(36090105988528368)
,p_name=>unistr('Impresi\00F3n de Actos')
,p_step_title=>unistr('Impresi\00F3n de Actos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=1',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js',
'#APP_IMAGES#pdf-lib.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var v_json = '''';',
'',
'function iniciar_flujo(id_instancia,id_fljo_trea){    ',
'    apex.server.process("AjaxIrFlujo", {f01: id_instancia, f02: id_fljo_trea}, {',
'        success: function (data) { ',
'            if (data.type === ''OK'') {',
'                console.log(data.test);',
'                window.localStorage.clear();',
'                window.location.href = data.url;',
'            }else{',
'                apex.message.showErrors({',
'                    type: apex.message.TYPE.ERROR,',
'                    location: ["page"],',
'                    message: data.msg,',
'                    unsafe: false',
'                });',
'            }',
'        },',
'        error: function () {',
'            console.log(arguments);',
'        }',
'    });',
'}',
'',
'function allFlujos(e,btn,ig, data){',
'     console.time(''loop'')',
'    console.log(''entro al seleccionar todo allFlujos'')',
'    var jsonFlujos = data.map((flujo) => {',
'        return {',
'            "ID_INSTNCIA_FLJO": flujo.ID_INSTNCIA_FLJO,',
'            "ID_FLJO_TREA_ORGEN": flujo.ID_FLJO_TREA_ORGEN,',
'            "ID_SJTO_IMPSTO": flujo.ID_SJTO_IMPSTO,',
'            "ID_FSCLZCION_EXPDNTE": flujo.ID_FSCLZCION_EXPDNTE,',
'            "ID_CNDDTO": flujo.ID_CNDDTO,',
'            "IDNTFCCION_SJTO": flujo.IDNTFCCION_SJTO,',
'            "ID_PRGRMA": flujo.ID_PRGRMA,',
'            "ID_SBPRGRMA": flujo.ID_SBPRGRMA,',
'            "ID_ACTO":flujo.ID_ACTO,',
'            "NUMERO_ACTO":flujo.NUMERO_ACTO',
'        }; ',
'    });',
'      console.timeEnd(''loop'')',
'    console.log(''Termino el seleccionar todo'')',
'    ',
'    window.localStorage.setItem(''jsonFlujos'', JSON.stringify(jsonFlujos));',
'}',
'',
'//--------------------------------------IMPRESION---------------------------------------------------------------------//',
'',
'',
'function obtenerActos(){',
'    var region = apex.region("fiscalizacion");',
'    var responsables  = [];',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;  ',
'        var records = view.view$.grid("getSelectedRecords");',
'        if($.isEmptyObject(records) == false){',
'            for(let i=0; i<records.length; i++){',
'                if((model.getValue(records[i], "GENERADO") === ''No'' ? false : true))',
'                responsables.push({"ID_ACTO": model.getValue(records[i], "ID_ACTO").trim(),',
'                                   "DSCRPCION_TREA": model.getValue(records[i], "DSCRPCION_TREA"),',
'                                   "ID_NTFCCION_DTLLE": model.getValue(records[i], "ID_NTFCCION_DTLLE"),',
'                                   "NUMERO_ACTO": model.getValue(records[i], "NUMERO_ACTO") });',
'            }',
'           v_json = JSON.stringify(responsables);',
'        }',
'        else{',
'           v_json = '''';',
'        }',
'    }',
'}',
'',
'function seleccionarTodos(e, btn, grid, datos ){',
'    console.time(''loop'')',
'    console.log(''entro al seleccionar todo'')',
'    ',
'    v_json = JSON.stringify(datos.map((m) => {',
'        return {"ID_ACTO": m["ID_ACTO"],',
'                "DSCRPCION_TREA" : m["DSCRPCION_TREA"],',
'                "ID_NTFCCION_DTLLE": m["ID_NTFCCION_DTLLE"],',
'                "NUMERO_ACTO": m["NUMERO_ACTO"]} ',
'    })); ',
'    console.timeEnd(''loop'')',
'    console.log(''Termino el seleccionar todo'')',
'}',
'',
'function ocultarBotonImprimir(){',
'  obtenerActos();',
'  if(v_json !== '''') {',
unistr('    if(v_json.includes(''Requerimiento de Inscripci\00F3n'') || v_json.includes(''Pliego de Cargos'')'),
unistr('       || v_json.includes(''Resoluci\00F3n Sanci\00F3n'') || v_json.includes(''Inscripci\00F3n Oficiosa'')|| v_json.includes(''Auto de Apertura - Desconocido'')|| true){'),
'      apex.item(''BTN_IMPRIMIR_INDIVIDUAL'').show();',
'      apex.item(''BTN_IMPRIMIR_MASIVO'').show() ;',
'    } else {',
'      apex.item(''BTN_IMPRIMIR_INDIVIDUAL'').hide();',
'      apex.item(''BTN_IMPRIMIR_MASIVO'').hide();',
'    }',
'  } else {',
'    apex.item(''BTN_IMPRIMIR_INDIVIDUAL'').hide();',
'    apex.item(''BTN_IMPRIMIR_MASIVO'').hide();',
'  }',
'}       ',
'',
'//---------------------IMPRESION---------------------------------------------------------------------//',
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
'  /*let  contenido = localStorage.getItem(''jsonFlujos'')',
'  let contentJson = JSON.parse(contenido)',
'  console.log(contentJson)',
'  contentJson.sort((a,b)=> {return a[''NUMERO_ACTO'']-b[''NUMERO_ACTO'']})*/',
'  ',
'  let contentJson = JSON.parse(v_json)',
'  let arraySort = contentJson.sort((a,b)=> {return a[''NUMERO_ACTO'']-b[''NUMERO_ACTO'']})',
'  console.log(arraySort)',
'  let cantidad = contentJson.length;',
'  console.log(''cantidad'', cantidad)',
'  if (cantidad > 0) {',
'    let PDFDocument = PDFLib.PDFDocument;',
'    const mergedPdf = await PDFDocument.create();',
'    let i = 1;',
'    let respData = [];',
'    while (i <= cantidad) {',
'      const { data } = await peticionServerProcess(''prc_co_imprimir_documeto'', { f01: JSON.stringify(arraySort), x01: i, x02: (i + 19 > cantidad ? cantidad : i + 19) });',
'      console.log(`# de datos => ${data.length}`)',
'      let j = 0',
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
'    zip.file(`Actos.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Actos.zip`, ''application/zip'');',
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
'  let contentJson = JSON.parse(v_json)',
'  ',
' contentJson.sort((a,b)=> {return a[''NUMERO_ACTO'']-b[''NUMERO_ACTO'']})',
'  ',
'  let cantidad = contentJson.length;',
'  let contador = 0;',
'  console.log(''cantidad'', v_json)',
'  if (cantidad > 0) {',
'    let i = 1;',
'    let respData = [];',
'    while (i <= cantidad) {',
'      const { data } = await peticionServerProcess(''prc_co_imprimir_documeto'', { f01: JSON.stringify(contentJson) , x01: i, x02: (i + 19 > cantidad ? cantidad : i + 19) });',
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
'       // zip.file(`Documento ${obj["NUMERO_ACTO"]}.pdf`, file);  "DSCRPCION_TREA",',
'        zip.file(`${data[j].fileName}`, file);',
'',
'        contador++;',
'        j++;',
'      }',
'      respData = respData.concat(data)',
'      i = i + 20;',
'    }',
'      ',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Actos.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}'))
,p_javascript_code_onload=>'apex.region("fiscalizacion").widget().interactiveGrid("setSelectedRecords", []);'
,p_step_template=>wwv_flow_api.id(36470205860968633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LARIZA'
,p_last_upd_yyyymmddhh24miss=>'20221220155323'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(73802239596609523)
,p_plug_name=>'Candidatos Fiscalizados'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(63884480657343121)
,p_plug_name=>unistr('Fiscalizaci\00F3n')
,p_region_name=>'fiscalizacion'
,p_parent_plug_id=>wwv_flow_api.id(73802239596609523)
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(36501974496968650)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *  ',
'from (select  a.id_sjto_impsto,',
'        g.idntfccion_sjto,',
'        a.id_cnddto,',
'        a.candidato,',
'        c.id_fsclzcion_expdnte,',
'        a.nmbre_impsto,',
'        a.nmbre_impsto_sbmpsto,',
'        a.id_prgrma,',
'        a.nmbre_prgrma,',
'        a.id_sbprgrma,',
'        a.nmbre_sbprgrma,',
'        c.id_instncia_fljo,',
'        d.id_fljo_trea_orgen,',
'        f.dscrpcion_trea,',
'        c.nmro_expdnte,',
'        trunc(c.fcha_aprtra ) as fcha_aprtra',
'        ,trunc(ac.fcha_crcion)   as fcha_gnra',
'        ,ac.id_acto as id_acto',
'		,w.nmro_acto       ',
'from v_fi_g_candidatos              a',
'join fi_g_candidatos_funcionario    b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte     c   on  a.id_cnddto             =   c.id_cnddto    ',
'join wf_g_instancias_transicion     d   on  c.id_instncia_fljo      =   d.id_instncia_fljo',
'join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'join fi_g_fsclzcion_expdnte_acto    ac  on  ac.id_fsclzcion_expdnte =   c.id_fsclzcion_expdnte',
'                                        and ac.id_fljo_trea         =   e.id_fljo_trea',
'left join gn_g_actos                w   on ac.id_acto  = w.id_acto ',
'where ac.id_acto is not null ',
'and a.cdgo_clnte = :F_CDGO_CLNTE',
'and b.id_fncnrio = nvl(:P73_ID_FNCNRIO,b.id_fncnrio)',
'and c.cdgo_expdnte_estdo = ''ABT''',
'--and d.id_estdo_trnscion in (1,2) ',
'and a.id_impsto = :P73_IMPUESTO',
'and a.id_prgrma = :P73_PRGRMA',
'and a.id_sbprgrma = :P73_SUBPRGRMA',
'and g.idntfccion_sjto   = nvl(:P73_IDNTFCCION_SJTO, g.idntfccion_sjto)',
'and e.id_fljo_trea = nvl(:P73_ETPA, e.id_fljo_trea)',
'order by ac.fcha_crcion desc);'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P73_PRGRMA,P73_SUBPRGRMA,P73_ETPA,P73_IDNTFCCION_SJTO,P73_IMPUESTO'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(21487165109028520)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>180
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
 p_id=>wwv_flow_api.id(82228676774652927)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(82976893165301522)
,p_name=>'DSCRPCION_TREA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_TREA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Etapa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_attribute_01=>'Y'
,p_attribute_02=>'N'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_is_required=>false
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83445048245828501)
,p_name=>'ID_SJTO_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SJTO_IMPSTO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(83445185981828502)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(83445240311828503)
,p_name=>'ID_CNDDTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_CNDDTO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>230
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83445349476828504)
,p_name=>'CANDIDATO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANDIDATO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Candidato'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(83445435176828505)
,p_name=>'ID_FSCLZCION_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FSCLZCION_EXPDNTE'
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
 p_id=>wwv_flow_api.id(83445528642828506)
,p_name=>'NMBRE_IMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(83445600346828507)
,p_name=>'NMBRE_IMPSTO_SBMPSTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_IMPSTO_SBMPSTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sub Impuesto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83445779369828508)
,p_name=>'ID_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRGRMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>280
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83445836213828509)
,p_name=>'NMBRE_PRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_PRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>290
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
 p_id=>wwv_flow_api.id(83445993345828510)
,p_name=>'ID_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_SBPRGRMA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>300
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83446082837828511)
,p_name=>'NMBRE_SBPRGRMA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_SBPRGRMA'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Sub programa'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>310
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
 p_id=>wwv_flow_api.id(83446142562828512)
,p_name=>'ID_INSTNCIA_FLJO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_INSTNCIA_FLJO'
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
 p_id=>wwv_flow_api.id(83446272428828513)
,p_name=>'ID_FLJO_TREA_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_FLJO_TREA_ORGEN'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>330
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(83446347775828514)
,p_name=>'NMRO_EXPDNTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_EXPDNTE'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'No. Expediente'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>340
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
 p_id=>wwv_flow_api.id(83446422430828515)
,p_name=>'FCHA_APRTRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_APRTRA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>350
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
 p_id=>wwv_flow_api.id(83446590061828516)
,p_name=>'FCHA_GNRA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_GNRA'
,p_data_type=>'DATE'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha del Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>360
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
 p_id=>wwv_flow_api.id(83446801552828519)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'No. Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>370
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
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(63884630320343122)
,p_internal_uid=>63884630320343122
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
'  config.initialSelection = false;',
'  window.localStorage.removeItem(''jsonFlujos'');',
'   return selectAll(config, {',
'       name: ''Seleccionar Todos'',',
'       action: seleccionarTodos',
'   }) ;',
'}'))
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(63895935043379579)
,p_interactive_grid_id=>wwv_flow_api.id(63884630320343122)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(63895994463379579)
,p_report_id=>wwv_flow_api.id(63895935043379579)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(21493218782028834)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>21
,p_column_id=>wwv_flow_api.id(21487165109028520)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83004246726576126)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>42
,p_column_id=>wwv_flow_api.id(82976893165301522)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83451338810841626)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>43
,p_column_id=>wwv_flow_api.id(83445048245828501)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83451969627841631)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>44
,p_column_id=>wwv_flow_api.id(83445185981828502)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83452579416841633)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>45
,p_column_id=>wwv_flow_api.id(83445240311828503)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83453181948841635)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>46
,p_column_id=>wwv_flow_api.id(83445349476828504)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83453708881841637)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>47
,p_column_id=>wwv_flow_api.id(83445435176828505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83454367879841639)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>48
,p_column_id=>wwv_flow_api.id(83445528642828506)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83454969379841641)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>49
,p_column_id=>wwv_flow_api.id(83445600346828507)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83455512003841643)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>50
,p_column_id=>wwv_flow_api.id(83445779369828508)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83456188586841645)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>51
,p_column_id=>wwv_flow_api.id(83445836213828509)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83456727392841647)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>52
,p_column_id=>wwv_flow_api.id(83445993345828510)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83457386253841649)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>53
,p_column_id=>wwv_flow_api.id(83446082837828511)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83457961773841650)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>54
,p_column_id=>wwv_flow_api.id(83446142562828512)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83458510066841653)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>55
,p_column_id=>wwv_flow_api.id(83446272428828513)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83459154805841655)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>56
,p_column_id=>wwv_flow_api.id(83446347775828514)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83459749860841657)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>57
,p_column_id=>wwv_flow_api.id(83446422430828515)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83460238628841659)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>58
,p_column_id=>wwv_flow_api.id(83446590061828516)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(83602202988574975)
,p_view_id=>wwv_flow_api.id(63895994463379579)
,p_display_seq=>61
,p_column_id=>wwv_flow_api.id(83446801552828519)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82219971053827420)
,p_plug_name=>'Total de flujos por etapa'
,p_parent_plug_id=>wwv_flow_api.id(73802239596609523)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>20
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  count(c.id_instncia_fljo)  as cantidad,',
'       d.id_fljo_trea_orgen,',
'       f.dscrpcion_trea ',
'from fi_g_candidatos                a',
'join fi_g_candidatos_funcionario    b   on  a.id_cnddto             =   b.id_cnddto',
'join fi_g_fiscalizacion_expdnte     c   on  a.id_cnddto             =   c.id_cnddto',
'join wf_g_instancias_transicion     d   on  c.id_instncia_fljo      =   d.id_instncia_fljo',
'join wf_d_flujos_tarea              e   on  d.id_fljo_trea_orgen    =   e.id_fljo_trea',
'join wf_d_tareas                    f   on  e.id_trea               =   f.id_trea',
'join v_si_i_sujetos_impuesto        g   on  a.id_sjto_impsto        =   g.id_sjto_impsto',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and b.id_fncnrio = :F_ID_FNCNRIO',
'    and c.cdgo_expdnte_estdo = ''ABT''',
'    and d.id_estdo_trnscion in (1,2) ',
'    and a.id_impsto = :P73_IMPUESTO',
'    and a.id_prgrma = :P73_PRGRMA',
'    and a.id_sbprgrma = :P73_SUBPRGRMA',
'    and g.idntfccion_sjto = nvl(:P73_IDNTFCCION_SJTO, g.idntfccion_sjto)',
'    and e.id_fljo_trea = nvl(:P73_ETPA, e.id_fljo_trea)',
'    and exists ( select  h.id_acto ',
'            from fi_g_fsclzcion_expdnte_acto h',
'            join gn_g_actos b on  b.id_acto =h.id_acto',
'           where h.id_fsclzcion_expdnte = c.id_fsclzcion_expdnte',
'             and h.id_fljo_trea =  e.id_fljo_trea',
'             and h.id_acto is not null)',
'group by d.id_fljo_trea_orgen, ',
'         f.dscrpcion_trea',
'order by f.dscrpcion_trea ;'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_02=>'CANTIDAD'
,p_attribute_05=>'0'
,p_attribute_07=>'BOX'
,p_attribute_08=>'Y'
,p_attribute_09=>'DSCRPCION_TREA'
);
end;
/
begin
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(82227970041652920)
,p_plug_name=>unistr('Par\00E1metros busquedas ')
,p_parent_plug_id=>wwv_flow_api.id(73802239596609523)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36491913657968646)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(101321173602179423)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>30
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
 p_id=>wwv_flow_api.id(101321403933180597)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(36503027129968651)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'    </b>',
'</h5>',
'',
'<p align="justify">',
unistr('<i>Funcionalidad que permite iniciar el proceso de fiscalizaci\00F3n a los candidatos asignados por el lider de fiscalizaci\00F3n adicionalmente permite eliminar el candidato o una vigencia per\00EDodo en especifica que no se va a fiscalizar.</i>'),
'</p>',
'',
'',
'<p align="justify">',
unistr('<i>Si desea conocer m\00E1s informaci\00F3n referente a la funcionalidad dir\00EDjase al Manual de Usuario.</i>'),
'</p>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14160674058835504)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(101321173602179423)
,p_button_name=>'BTN_IMPRIMIR_INDIVIDUAL'
,p_button_static_id=>'BTN_IMPRIMIR_INDIVIDUAL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir actos mas. '
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14160773493835505)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(101321173602179423)
,p_button_name=>'BTN_IMPRIMIR_MASIVO'
,p_button_static_id=>'BTN_IMPRIMIR_MASIVO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir actos ind.'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(14094585783513785)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(82227970041652920)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(36555682372968674)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(14124359483513898)
,p_branch_name=>'Ir a la pagina 11'
,p_branch_action=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,11::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'BORRAR'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14094903840513785)
,p_name=>'P73_IMPUESTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_prompt=>'Tributo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IMPUESTOS_X_MENU_X_USUARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmbre_impsto || '' ['' || a.cdgo_impsto || '']''display,',
'       a.id_impsto value',
'  from v_sg_g_menu_impuesto     a',
'  join sg_g_usuarios_impuesto   b on a.id_impsto = b.id_impsto',
' where a.cdgo_clnte       = :F_CDGO_CLNTE',
'   and a.id_aplccion_grpo = :F_ID_APLCCION_GRPO',
'   and a.id_mnu           = :F_ID_MNU',
'   and b.id_usrio         = :F_ID_USRIO',
'   and a.actvo            = ''S''',
'   and b.actvo            = ''S''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14095306895513802)
,p_name=>'P73_PRGRMA'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_prompt=>'Programa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_prgrma as d,',
'        a.id_prgrma as r ',
'from fi_d_programas a;'))
,p_lov_display_null=>'YES'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14095745772513803)
,p_name=>'P73_SUBPRGRMA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_prompt=>'SubPrograma'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.nmbre_sbprgrma as d,',
'        a.id_sbprgrma as r ',
'from fi_d_subprogramas a',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.id_prgrma = :P73_PRGRMA',
'and actvo = ''S'';',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P73_PRGRMA'
,p_ajax_items_to_submit=>'P73_SUBPRGRMA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14096141371513803)
,p_name=>'P73_FLJO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_prompt=>'Flujo'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion_fljo as d,',
'       a.id_fljo as r',
'from wf_d_flujos a',
'where a.id_fljo = (select  b.id_fljo ',
'                   from fi_d_programas b',
'                   where b.id_prgrma = :P73_PRGRMA);'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P73_PRGRMA'
,p_ajax_items_to_submit=>'P73_FLJO'
,p_ajax_optimize_refresh=>'Y'
,p_field_template=>wwv_flow_api.id(36555238905968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14096547423513803)
,p_name=>'P73_ETPA'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_prompt=>'Etapa'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.dscrpcion_trea,',
'       a.id_fljo_trea',
'from wf_d_flujos_tarea  a',
'join wf_d_tareas        b   on  a.id_trea   =   b.id_trea',
'where a.id_fljo = :P73_FLJO',
'order by b.dscrpcion_trea;'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P73_FLJO'
,p_ajax_items_to_submit=>'P73_ETPA'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14096988025513803)
,p_name=>'P73_IDNTFCCION_SJTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_prompt=>unistr('Identificaci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14097365061513804)
,p_name=>'P73_CSAL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14097795456513804)
,p_name=>'P73_CDGO_FLJO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(14098135845513804)
,p_name=>'P73_ID_TPO_ACTO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(26275131431860394)
,p_name=>'P73_ID_FNCNRIO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(82227970041652920)
,p_prompt=>'Funcionario'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LV_FUNCIONARIO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_trcro as d,',
'       a.id_fncnrio  as r',
'from df_c_funcionarios a ',
'join v_si_c_terceros   b  on a.id_trcro = b.id_trcro',
'join df_c_oficinas     c  on a.id_ofcna = c.id_ofcna',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'--and c.nmbre_ofcna = ''FISCALIZACION''',
'order by b.nmbre_trcro;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>4
,p_field_template=>wwv_flow_api.id(36554931184968673)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NOT_ENTERABLE'
,p_attribute_02=>'FIRST_ROWSET'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14111878273513863)
,p_validation_name=>'Requerido'
,p_validation_sequence=>10
,p_validation=>'P73_IMPUESTO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Impuesto'
,p_when_button_pressed=>wwv_flow_api.id(14094585783513785)
,p_associated_item=>wwv_flow_api.id(14094903840513785)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14112270500513868)
,p_validation_name=>'Requerido programa'
,p_validation_sequence=>20
,p_validation=>'P73_PRGRMA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Programa'
,p_when_button_pressed=>wwv_flow_api.id(14094585783513785)
,p_associated_item=>wwv_flow_api.id(14095306895513802)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14112623359513868)
,p_validation_name=>'Requerido subprograma'
,p_validation_sequence=>30
,p_validation=>'P73_SUBPRGRMA'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Subprograma'
,p_when_button_pressed=>wwv_flow_api.id(14094585783513785)
,p_associated_item=>wwv_flow_api.id(14095745772513803)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(14113046757513868)
,p_validation_name=>'Requerido flujo'
,p_validation_sequence=>40
,p_validation=>'P73_FLJO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Seleccione el Flujo'
,p_when_button_pressed=>wwv_flow_api.id(14094585783513785)
,p_associated_item=>wwv_flow_api.id(14096141371513803)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14119251149513891)
,p_name=>'Abrir Expediente'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(49143665113313019)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14119740280513892)
,p_event_id=>wwv_flow_api.id(14119251149513891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function abrirExpediente() {',
'    try {',
'        var popup = apex.widget.waitPopup();',
'        var json = window.localStorage.jsonVigencia;',
'        await apex.server.process("ajaxAbrirExpediente", {',
'            f01: json,',
'            pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO"',
'        },{',
'            success: function(data) {',
'                console.log(data);',
'                popup.remove();',
'                if(data.o_cdgo_rspsta > 0) {',
'                    console.log(data.o_mnsje_rspsta);',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type:       "error",',
'                            location:   "page",',
'                            message:    data.o_mnsje_rspsta,',
'                            unsafe:     false',
'                        }',
'                    ]);',
'                } else {',
unistr('                    apex.message.showPageSuccess("Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit({request : "BORRAR"});',
'                }',
'            }',
'        })',
'    ',
'    } catch(e) {',
'        popup.remove();',
'        console.log(e);',
'    }',
'}',
'',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de iniciar el proceso de Fiscalizaci\00F3n?", function(okPressed) {'),
'   if(okPressed) {',
'       abrirExpediente();',
'   } ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14120111079513892)
,p_name=>'Al Seleccionar'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(63884480657343121)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14120689304513893)
,p_event_id=>wwv_flow_api.id(14120111079513892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'ocultarBotonImprimir();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14160941169835507)
,p_name=>'imprimir'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14160674058835504)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14161036971835508)
,p_event_id=>wwv_flow_api.id(14160941169835507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(14251554921186710)
,p_name=>'imprimir zip masivo'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(14160773493835505)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(14251647945186711)
,p_event_id=>wwv_flow_api.id(14251554921186710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'merge_2();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14115765344513876)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Tipo de Acto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'',
'   select cdgo_fljo',
'   into :P73_CDGO_FLJO',
'   from wf_d_flujos',
'   where id_fljo = :P73_FLJO;',
'    ',
'exception',
'    when others then',
'        :P73_CDGO_FLJO :=null;    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14160842211835506)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_imprimir_documeto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_clob	         clob;',
'  v_valor_1        number := APEX_APPLICATION.g_x01;',
'  v_valor_2        number := APEX_APPLICATION.g_x02;',
'  v_archvo_blob    blob;',
'  v_cdgo_rspsta    number;',
'  v_mnsje_rspsta   varchar2(1000);',
'  v_json           clob;',
'begin',
'',
'  for i in 1..apex_application.g_f01.count  loop',
'    v_json := v_json ||  apex_application.g_f01(i);',
'  end loop;',
'  ',
'  apex_json.open_object;        -- {',
'  apex_json.open_array(''data''); --  , "data":[',
'  for c_document in (select * ',
'                     from (select rownum r, d.*',
'                              from (select c.file_blob, c.file_name, c.file_bfile, a.nmro_acto,e.cdgo_acto_tpo',
'                                      from gn_g_actos a',
'                                      join (Select ID_ACTO From json_table(v_json,''$[*]''columns ID_ACTO PATH ''$.ID_ACTO'')) b on b.id_acto = a.id_acto',
'                                      join gd_g_documentos c on c.id_dcmnto = a.id_dcmnto',
'                                     join gn_d_actos_tipo e on  a.id_Acto_tpo = e.id_Acto_tpo',
'                                     where  c.file_blob is not null or c.file_bfile is not null',
'                                       order by a.nmro_acto asc) d)',
'                      where r >= v_valor_1 and r <= v_valor_2) loop',
'                      ',
'    if c_document.file_blob is null then',
'      pkg_gd_utilidades.prc_co_archco_dsco(p_bfile         => c_document.file_bfile',
'                                         , o_archvo_blob   => v_archvo_blob',
'                                         , o_cdgo_rspsta   => v_cdgo_rspsta',
'                                         , o_mnsje_rspsta  => v_mnsje_rspsta);',
'      l_CLOB := apex_web_service.blob2clobbase64(v_archvo_blob);',
'    else',
'      l_CLOB := apex_web_service.blob2clobbase64(c_document.file_blob);',
'    end if;',
'                                       ',
'    apex_json.open_object;    --    {',
'    apex_json.write(''fileBlob'', l_CLOB); --      "fileBlob": documento en blob',
'   --apex_json.write(''fileName'', c_document.file_name); --      "fileName": nombre del documento',
'    apex_json.write(''fileName'', c_document.cdgo_acto_tpo||''''||c_document.file_name); --      "fileName": nombre del documento',
'',
'    --numero_Acto',
'    apex_json.write(''numero_Acto'', c_document.nmro_acto); ',
'     ',
'    apex_json.close_object;   --    }',
'      ',
'  end loop;',
'  apex_json.close_all;          --  ]   -- }',
'  exception  ',
'  when    others   then',
'      insert into muerto(v_001)values(''Error'');',
'  ',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(14251760154186712)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'AjaxIrFlujo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   v_id_instncia_fljo number := apex_application.g_f01(1);',
'   v_id_fljo_trea number;-- := apex_application.g_f02(1);',
'   v_url varchar2(4000);',
'   v_id_fljo_trea_orgen number;',
'   ',
'   begin',
'   ',
'       begin',
'           select id_fljo_trea_orgen',
'           into v_id_fljo_trea_orgen',
'           from wf_g_instancias_transicion',
'           where id_instncia_fljo = v_id_instncia_fljo',
'           and id_estdo_trnscion in (1,2);',
'           --insert into muerto(v_001) values (v_id_fljo_trea_orgen); commit;',
'       exception',
'           when no_data_found then',
'               begin',
'                   select distinct first_value(id_fljo_trea_orgen) over (order by id_instncia_trnscion desc)',
'                   into v_id_fljo_trea_orgen',
'                   from wf_g_instancias_transicion',
'                   where id_instncia_fljo = v_id_instncia_fljo;',
'                   ',
'              exception',
'                  when others then',
'                      v_id_fljo_trea_orgen := null;',
'              end;',
'           when others then',
'               v_id_fljo_trea_orgen := null;',
'       end;',
'       ',
'       apex_util.set_session_state(''F_ID_INSTNCIA_FLJO'', v_id_instncia_fljo );',
'       apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea_orgen );            	',
'       v_url := pkg_pl_workflow_1_0.fnc_gn_tarea_url(p_id_instncia_fljo => v_id_instncia_fljo,',
'                                                     p_id_fljo_trea     => v_id_fljo_trea_orgen,',
'                                                     p_clear_session    => ''S'');',
'       apex_json.open_object;',
'       apex_json.write(''type'', ''OK'');',
'       apex_json.write(''msg'', ''Url generada exitosamente'');',
'       apex_json.write(''url'', v_url);',
'       apex_json.write(''test'', 1);',
'       apex_json.close_all();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
