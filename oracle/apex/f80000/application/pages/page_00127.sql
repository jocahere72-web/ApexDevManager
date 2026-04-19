prompt --application/pages/page_00127
begin
wwv_flow_api.create_page(
 p_id=>127
,p_user_interface_id=>wwv_flow_api.id(17431055073919422)
,p_name=>unistr('127. Generaci\00F3n/Impresi\00F3n de Actos Persuasivos')
,p_step_title=>unistr('127. Generaci\00F3n/Impresi\00F3n de Actos Persuasivos')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=#APP_VERSION#',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#FileSaver.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*',
'    VARIABLES GLOBALES',
'*/',
'var v_app_id  = $v(''pFlowId''),',
'    v_page_id = $v(''pFlowStepId''),',
'    v_session = $v(''pInstance'');',
'',
'function validar_seleccion(valid) {',
'    ',
'    var region = apex.region("documentos");',
'    var view = region.widget().interactiveGrid("getCurrentView");',
'    var model = view.model;',
'    var records = view.getSelectedRecords();',
'    ',
'    var json = records.map(function (record) {',
'         return {',
'            "ID_PRCSOS_PRSSVO_DCMNTO": model.getValue(record, "ID_PRCSOS_PRSSVO_DCMNTO"),',
'            "ID_PRCSOS_PRSSVO": model.getValue(record, "ID_PRCSOS_PRSSVO"),',
'            "ID_ACTO_TPO": model.getValue(record, "ID_ACTO_TPO"),',
'            "CDGO_SJTO_ORGEN": model.getValue(record, "CDGO_SJTO_ORGEN").trim(), ',
'            "ID_ACTO": model.getValue(record, "ID_ACTO"),',
'            "ID_PLNTLLA": model.getValue(record, "ID_PLNTLLA")',
'        };      ',
'    });',
'    ',
'    console.log(''JSON Generado: '', JSON.stringify(json));',
'',
'    // Guardar en localStorage',
'    window.localStorage.setItem(''jsonActosPersuasivos'', json.length > 0 ? JSON.stringify(json) : '''');       ',
'    ',
'    ',
'    var arr_imprimir = json.map(item => ({ ''ID'': item.ID_PRCSOS_PRSSVO_DCMNTO }));',
'   ',
'    console.log(''json.length: '',json.length);',
'    if (json.length > 0) {',
'        var id_actos = json.some(item => item.ID_ACTO === '''');',
'        console.log(''id_actos: '',id_actos);',
'        if (id_actos) {',
unistr('           apex.item("BTN_GNERAR_ACTOS").show(); // Mostrar bot\00F3n de generar'),
'            apex.item("BTN_IMPRMIR_ACTOS").hide();',
'        } else {',
'            apex.item("BTN_GNERAR_ACTOS").hide();',
unistr('            apex.item("BTN_IMPRMIR_ACTOS").show(); // Mostrar bot\00F3n de imprimir'),
'        }',
'    } else {',
'        // Si no hay registros seleccionados, ocultar ambos botones',
'        apex.item("BTN_GNERAR_ACTOS").hide();',
'        apex.item("BTN_IMPRMIR_ACTOS").hide();',
'    }',
'    ',
'    $s(''P127_JSON'', JSON.stringify(arr_imprimir));',
'}',
'',
'',
'function seleccionarTodos(e,btn,grid,data){',
'    var datos = data.filter((f) => f.INDCDOR_PRCSDO.v === ''N'').map((m) => {',
'            return { "ID_PRCSOS_PRSSVO_DCMNTO": m.ID_PRCSOS_PRSSVO_DCMNTO,',
'                     "ID_PRCSOS_PRSSVO": m.ID_PRCSOS_PRSSVO,',
'                     "ID_ACTO_TPO": m.ID_ACTO_TPO,',
'                     "CDGO_SJTO_ORGEN": m.CDGO_SJTO_ORGEN',
'                   };',
'        }); ',
'    window.localStorage.setItem(''jsonActosPersuasivos'', JSON.stringify(datos));',
'}',
'',
'',
'const generarActos = async function() {',
'    // Obtener el JSON de localStorage',
'    var json_actos = localStorage.getItem(''jsonActosPersuasivos'');',
'',
unistr('    // Validar que exista y no est\00E9 vac\00EDo'),
'    if (!json_actos || json_actos.length === 0) {',
'        apex.message.clearErrors();',
'        apex.message.alert(''No se han seleccionado registros a procesar.'');',
'        return;',
'    }',
'',
'    console.log(''json_actos: '', json_actos);',
'',
'    apex.message.confirm(',
unistr('        "\00BFDesea generar actos de cobro persuasivo para los registros seleccionados?",'),
'        async function(okPressed) {',
'            if (!okPressed) return;',
'',
'            console.log(''Antes de llamar a la up Generar_Actos'');',
'            var popup = apex.widget.waitPopup();',
'',
'            try {',
'                ',
'                let pData = await apex.server.process(',
'                    "Generar_Actos",',
'                    {',
'                        f01: json_actos,',
'                        pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO"',
'                    }',
'                );',
'',
'                popup.remove(); ',
'',
'                if (pData.o_cdgo_rspsta != 0) {',
'                    apex.message.clearErrors();',
'                    apex.message.alert(pData.o_mnsje_rspsta);',
'                } else {',
'                    apex.message.alert(pData.o_mnsje_rspsta, function() {',
'                        apex.submit("BTN_GNERAR_ACTOS");',
'                    });                    ',
'                }',
'            } catch (error) {',
'                popup.remove(); ',
'                console.error(''Error en el proceso del servidor:'', error);',
unistr('                apex.message.alert(''Ocurri\00F3 un error durante el procesamiento. Por favor, intente nuevamente.'');'),
'            }',
'        }',
'    );',
'};',
'',
'',
'const merge_oficios_x_resolucion = async () => {',
'',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  let v_json = localStorage.getItem(''jsonActosPersuasivos'');',
'  let contentJson = JSON.parse(v_json)',
'  let array = JSON.parse(v_json);',
'  let cantidad = array.length;',
'  let contador = 0;',
'    ',
'    console.log(''contentJson: '',contentJson);',
'    console.log(''array: '',array);',
'    console.log(''cantidad: '',cantidad);',
'    ',
'  if (cantidad >= 0) {',
'    let i = 0;',
'    let respData = [];',
' ',
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
'            //Data de los actos pertenecientes a los oficios persuasivos.',
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
'        ',
'    const mergedPdfFile = await mergedPdf.save();',
'    zip.file(''Oficios_Persuasivos.pdf'', mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Oficios_Persuasivos.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    apex.message.alert(''No existen documentos asociados.'')',
'  }',
'  popup.remove();',
'}',
'',
unistr('// Funci\00F3n auxiliar para generar y descargar el ZIP'),
'async function generateAndDownloadZip(mergedPdf, fileName) {',
'    try {',
'        const mergedPdfFile = await mergedPdf.save();',
'        const zip = new JSZip();',
'        zip.file(`${fileName}.pdf`, mergedPdfFile);',
'',
'        const zipBlob = await zip.generateAsync({ type: ''blob'' });',
'        download(zipBlob, `${fileName}.zip`, ''application/zip'');',
'    } catch (error) {',
'        console.error(''Error al generar o descargar el ZIP:'', error);',
'        apex.message.alert(''No se pudo generar el archivo ZIP.'');',
'    }',
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
'function validacion() {',
'    ',
'    var lote = apex.item("P127_LTE_SLCCION_PRSSVO").getValue();',
'    var fecha_ini = apex.item("P127_FCHA_DSDE").getValue();',
'    var fecha_fin = apex.item("P127_FCHA_HSTA").getValue();',
'    var acto = apex.item("P127_NMRO_ACTO").getValue();',
'    ',
'    if ( lote === "" && fecha_ini === "" && fecha_fin === "" && acto === "") {',
unistr('        apex.message.alert(''Debe ingresar al menos un par\00E1metro de b\00FAsqueda'');'),
'        return false; ',
'    } else {',
'        return true; ',
'    }',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'validar_seleccion();',
'',
'if( apex.region("documentos") )',
'    apex.region("documentos").widget().interactiveGrid("getViews", "grid").view$.grid("selectAll");'))
,p_step_template=>wwv_flow_api.id(17324973689919355)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'LPICO'
,p_last_upd_yyyymmddhh24miss=>'20260319024327'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9497799533945201)
,p_plug_name=>unistr('Notificaci\00F3n')
,p_region_name=>'notificacion'
,p_region_template_options=>'js-dialog-autoheight:js-resizable:js-dialog-size720x480'
,p_plug_template=>wwv_flow_api.id(17353790839919372)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(9505913200054604)
,p_plug_name=>'Actos'
,p_region_name=>'actos'
,p_parent_plug_id=>wwv_flow_api.id(9497799533945201)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_prcsos_prssvo_dcmnto,',
'       a.dscrpcion_acto_tpo,',
'       a.nmro_acto,',
'       a.fcha_acto,       ',
'       b.NMBRE_CMPLTO,',
'       b.IDNTFCCION,',
'       a.id_plntlla,',
'       a.dcmnto,',
'       a.id_acto_tpo,',
'       a.id_prcsos_prssvo,',
'       a.cdgo_sjto_orgen,',
'       a.id_acto,',
'       ID_PRCSOS_PRSSVO_RSPNSBLE,',
'       case ',
'        when a.nmro_acto is null then',
'           ''N''',
'       else',
'           ''S''',
'       end as indcdor_prcsdo,',
'       b.email,',
'       case',
'        when a.nmro_acto is not null then',
'          ''<center>',
'            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver<span class="fa fa-eye"></span>',
'            </button>',
'          </center>''',
'         else',
'           null',
'         end ver_acto',
'from v_cb_g_procesos_prssvo_dcmnto a',
'join v_cb_g_prcsos_prssvo_rspsble b ',
'    on a.id_prcsos_prssvo = b.id_prcsos_prssvo',
'where ((trunc(a.fcha_rgstro) >= :P127_FCHA_DSDE and',
'       trunc(a.fcha_rgstro) <= :P127_FCHA_HSTA) or',
'       :P127_FCHA_DSDE is null and :P127_FCHA_HSTA is null)',
'   and (a.nmro_acto = :P127_NMRO_ACTO or :P127_NMRO_ACTO is null)',
'   and (a.ID_PRCSO_PRSSVO_LTE = :P127_LTE_SLCCION_PRSSVO or',
'       :P127_LTE_SLCCION_PRSSVO is null)',
'   --and b.email is not null  ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9506134259054606)
,p_name=>'ID_PRCSOS_PRSSVO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO_DCMNTO'
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
 p_id=>wwv_flow_api.id(9506225056054607)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9506323461054608)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(9506404940054609)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>60
,p_value_alignment=>'CENTER'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
,p_format_mask=>'DD/MM/YYYY'
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
 p_id=>wwv_flow_api.id(9506585618054610)
,p_name=>'ID_PLNTLLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PLNTLLA'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9506624017054611)
,p_name=>'DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DCMNTO'
,p_data_type=>'CLOB'
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
 p_id=>wwv_flow_api.id(9506746220054612)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
,p_data_type=>'NUMBER'
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
 p_id=>wwv_flow_api.id(9506838440054613)
,p_name=>'ID_PRCSOS_PRSSVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attribute_01=>'Y'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9506918604054614)
,p_name=>'CDGO_SJTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_SJTO_ORGEN'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(9507084396054615)
,p_name=>'ID_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO'
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
 p_id=>wwv_flow_api.id(9507190688054616)
,p_name=>'INDCDOR_PRCSDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PRCSDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(9507262354054617)
,p_name=>'EMAIL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMAIL'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Email'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>140
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_api.id(9507339678054618)
,p_name=>'VER_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attribute_01=>'Y'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9507482655054619)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>20
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(9507514481054620)
,p_name=>'APEX$ROW_ACTION'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>10
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37143708126816201)
,p_name=>'ID_PRCSOS_PRSSVO_RSPNSBLE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO_RSPNSBLE'
,p_data_type=>'NUMBER'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
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
 p_id=>wwv_flow_api.id(37149993962861801)
,p_name=>'NMBRE_CMPLTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMBRE_CMPLTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Nombre Completo'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>180
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
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(37150037739861802)
,p_name=>'IDNTFCCION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
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
 p_id=>wwv_flow_api.id(9506001503054605)
,p_internal_uid=>9506001503054605
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(9511210731066584)
,p_interactive_grid_id=>wwv_flow_api.id(9506001503054605)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(9511390967066584)
,p_report_id=>wwv_flow_api.id(9511210731066584)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9511807106066588)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(9506134259054606)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9512341872066592)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(9506225056054607)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9512828889066594)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(9506323461054608)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9513346654066596)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(9506404940054609)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9513839373066598)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(9506585618054610)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9514359675066599)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(9506624017054611)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9514857654066600)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(9506746220054612)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9515305443066602)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(9506838440054613)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9515825695066603)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(9506918604054614)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9516324765066604)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(9507084396054615)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9516894835066606)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(9507190688054616)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9517327467066607)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(9507262354054617)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9517809336066609)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(9507339678054618)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(9524279318151571)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>0
,p_column_id=>wwv_flow_api.id(9507514481054620)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37149892582816444)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>16
,p_column_id=>wwv_flow_api.id(37143708126816201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37156048234861876)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>17
,p_column_id=>wwv_flow_api.id(37149993962861801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(37156685346861878)
,p_view_id=>wwv_flow_api.id(9511390967066584)
,p_display_seq=>18
,p_column_id=>wwv_flow_api.id(37150037739861802)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(138909683597587117)
,p_plug_name=>unistr('<b>Par\00E1metros</b>')
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
 p_id=>wwv_flow_api.id(138910309319587124)
,p_plug_name=>'<b>Opciones</b>'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139579084673644701)
,p_plug_name=>'Ayuda'
,p_parent_plug_id=>wwv_flow_api.id(138910309319587124)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(17356902947919375)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<center><b>Ayuda</b></center>',
'<br>',
'<p style="text-align: justify;"><b>1 - Consulta de documento</b>: Utilice el rango de fechas para consultar los documentos registrados.</p>',
unistr('<p style="text-align: justify;"><b>2 - Generar documnentos</b>: Al seleccionar en la gilla un registro, si a\00FAn no posee un n\00FAmero de Acto asignado se habilitar\00E1 un bot\00F3n [Generar Actos] con el cual se realiza el proceso de generaci\00F3n de actos en el s')
||'istema.</p>',
unistr('<p style="text-align: justify;"><b>Impresi\00F3n de actos</b>: Una vez generado los actos de cobro persuasivo, podr\00E1 realizar una impresi\00F3n de estos mismos en formato ZIP mediante un click sobre el bot\00F3n [Imprimir Actos]</p>')))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(139400257857849526)
,p_plug_name=>'Actos de Cobro Persuasivo'
,p_region_name=>'documentos'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(17355873415919374)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select a.id_prcsos_prssvo_dcmnto,',
'       a.dscrpcion_acto_tpo,',
'       --b.IDNTFCCION_SJTO,',
'       (select distinct a.idntfccion_sjto',
'        from v_si_i_sujetos_impuesto a ',
'        join cb_g_procesos_prssvo_mvmnto b on b.id_sjto_impsto = a.id_sjto_impsto and b.id_impsto = a.id_impsto',
'        join cb_g_procesos_prssvo_dcmnto c on c.ID_PRCSOS_PRSSVO = b.ID_PRCSOS_PRSSVO',
'        where c.id_prcsos_prssvo_dcmnto = a.id_prcsos_prssvo_dcmnto and rownum = 1) as IDNTFCCION_SJTO,',
'       a.nmro_acto,',
'       a.fcha_acto,',
'       a.id_plntlla,',
'       a.dcmnto,',
'       a.id_acto_tpo,',
'       a.id_prcsos_prssvo,',
'       a.cdgo_sjto_orgen,',
'       a.id_acto,',
'       case ',
'        when a.nmro_acto is null then',
'           ''N''',
'       else',
'           ''S''',
'       end as indcdor_prcsdo,',
'      -- a.email,',
'       case',
'        when a.nmro_acto is not null then',
'          ''<center>',
'            <button style="color:blue" type="button" class="a-Button a-Button--noLabel a-Button--iconTextButton" tabindex="0">Ver<span class="fa fa-eye"></span>',
'            </button>',
'          </center>''',
'         else',
'           null',
'         end ver_acto',
'from v_cb_g_procesos_prssvo_dcmnto a',
'--join v_si_i_sujetos_impuesto b on b.id_sjto = a.ID_SJTO_ORGEN',
'--join cb_g_procesos_prssvo_mvmnto c on c.ID_PRCSOS_PRSSVO = a.ID_PRCSOS_PRSSVO',
'where ((trunc(a.fcha_rgstro) >= :P127_FCHA_DSDE and',
'       trunc(a.fcha_rgstro) <= :P127_FCHA_HSTA) or',
'       :P127_FCHA_DSDE is null and :P127_FCHA_HSTA is null)',
'   and (a.nmro_acto = :P127_NMRO_ACTO or :P127_NMRO_ACTO is null)',
'   and (a.ID_PRCSO_PRSSVO_LTE = :P127_LTE_SLCCION_PRSSVO or',
'       :P127_LTE_SLCCION_PRSSVO is null)',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
);
end;
/
begin
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(28343699020289301)
,p_name=>'IDNTFCCION_SJTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IDNTFCCION_SJTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('Identificaci\00F3n Sujeto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
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
 p_id=>wwv_flow_api.id(139400432144849528)
,p_name=>'ID_PRCSOS_PRSSVO_DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO_DCMNTO'
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
 p_id=>wwv_flow_api.id(139400553410849529)
,p_name=>'DSCRPCION_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DSCRPCION_ACTO_TPO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tipo Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_api.id(139400692338849530)
,p_name=>'NMRO_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NMRO_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>unistr('N\00FAmero Acto')
,p_heading_alignment=>'CENTER'
,p_display_sequence=>50
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
 p_id=>wwv_flow_api.id(139400794899849531)
,p_name=>'FCHA_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FCHA_ACTO'
,p_data_type=>'TIMESTAMP'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER'
,p_heading=>'Fecha Acto'
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
 p_id=>wwv_flow_api.id(139400818547849532)
,p_name=>'ID_PLNTLLA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PLNTLLA'
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
 p_id=>wwv_flow_api.id(139400988793849533)
,p_name=>'DCMNTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DCMNTO'
,p_data_type=>'CLOB'
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
 p_id=>wwv_flow_api.id(139401017532849534)
,p_name=>'ID_ACTO_TPO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_ACTO_TPO'
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
 p_id=>wwv_flow_api.id(139401167577849535)
,p_name=>'ID_PRCSOS_PRSSVO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ID_PRCSOS_PRSSVO'
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
 p_id=>wwv_flow_api.id(139401277512849536)
,p_name=>'CDGO_SJTO_ORGEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CDGO_SJTO_ORGEN'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(139401338944849537)
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
 p_id=>wwv_flow_api.id(139401449010849538)
,p_name=>'INDCDOR_PRCSDO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDCDOR_PRCSDO'
,p_data_type=>'VARCHAR2'
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
 p_id=>wwv_flow_api.id(139401664652849540)
,p_name=>'APEX$ROW_SELECTOR'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_api.create_region_column(
 p_id=>wwv_flow_api.id(139497509479172309)
,p_name=>'VER_ACTO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VER_ACTO'
,p_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Ver Acto'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attribute_01=>'&VER_ACTO.'
,p_link_target=>'f?p=50000:127:&SESSION.::&DEBUG.:RP:P127_NOMBRE_TABLA,P127_COLUMNA_FILENAME,P127_COLUMNA_BLOB,P127_COLUMNA_MIME,P127_COLUMNA_CLAVE_PRIMARIA,P127_VALOR:v_gn_g_actos,FILE_NAME,FILE_BLOB,FILE_MIMETYPE,ID_ACTO,&ID_ACTO.'
,p_filter_is_required=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_api.create_interactive_grid(
 p_id=>wwv_flow_api.id(139400329107849527)
,p_internal_uid=>139400329107849527
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
);
wwv_flow_api.create_ig_report(
 p_id=>wwv_flow_api.id(139446055797426436)
,p_interactive_grid_id=>wwv_flow_api.id(139400329107849527)
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_api.create_ig_report_view(
 p_id=>wwv_flow_api.id(139446183453426437)
,p_report_id=>wwv_flow_api.id(139446055797426436)
,p_view_type=>'GRID'
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(28349706287289417)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>14
,p_column_id=>wwv_flow_api.id(28343699020289301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139446618778426438)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>1
,p_column_id=>wwv_flow_api.id(139400432144849528)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139447136645426439)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>2
,p_column_id=>wwv_flow_api.id(139400553410849529)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139447679961426441)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>3
,p_column_id=>wwv_flow_api.id(139400692338849530)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139448137006426443)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>4
,p_column_id=>wwv_flow_api.id(139400794899849531)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139448686145426449)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>5
,p_column_id=>wwv_flow_api.id(139400818547849532)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139449171193426451)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>6
,p_column_id=>wwv_flow_api.id(139400988793849533)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139449625854426453)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>7
,p_column_id=>wwv_flow_api.id(139401017532849534)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139450067114426456)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>8
,p_column_id=>wwv_flow_api.id(139401167577849535)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139450513347426458)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>9
,p_column_id=>wwv_flow_api.id(139401277512849536)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139451048805426460)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>10
,p_column_id=>wwv_flow_api.id(139401338944849537)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139451519441426462)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>11
,p_column_id=>wwv_flow_api.id(139401449010849538)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_ig_report_column(
 p_id=>wwv_flow_api.id(139537319678459954)
,p_view_id=>wwv_flow_api.id(139446183453426437)
,p_display_seq=>13
,p_column_id=>wwv_flow_api.id(139497509479172309)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138910464621587125)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(138909683597587117)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(17409089099919398)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138911265165587133)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(138910309319587124)
,p_button_name=>'BTN_GNERAR_ACTOS'
,p_button_static_id=>'BTN_GNERAR_ACTOS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Generar Actos'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-gear'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(138912742856587148)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(138910309319587124)
,p_button_name=>'BTN_IMPRMIR_ACTOS'
,p_button_static_id=>'BTN_IMPRMIR_ACTOS'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Descargar <br>Oficios Individuales'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-file-pdf-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(3903850952752468)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(138910309319587124)
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
 p_id=>wwv_flow_api.id(4026300071593301)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(138910309319587124)
,p_button_name=>'BTN_RCNSTRIR_ACTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Reconstruir Acto'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9497874464945202)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(138910309319587124)
,p_button_name=>'BTN_OPEN_MODAL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Notificar Por Email'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(2933335006971512)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(9505913200054604)
,p_button_name=>'BTN_EMAIL'
,p_button_static_id=>'email'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(17409110614919398)
,p_button_image_alt=>'Enviar Por Email'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-send-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(139496968037172303)
,p_branch_name=>'Ir a la pag  127'
,p_branch_action=>'f?p=&APP_ID.:127:&SESSION.:BTN_IMPRMIR_ACTOS:&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(138912742856587148)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3190601927159004)
,p_name=>'P127_NMRO_ACTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(138909683597587117)
,p_prompt=>unistr('N\00FAmero De Acto')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_tag_attributes=>'oninput="this.value=this.value.replace(/[^0-9]/g,'''');"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(3899569353630903)
,p_name=>'P127_LTE_SLCCION_PRSSVO'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(138909683597587117)
,p_prompt=>unistr('Lote de Selecci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct''*Lote: '' || a.id_prcso_prssvo_lte || '' *Fecha: '' ||',
'       to_char(a.fcha_prcso, ''dd/mm/yyyy'') || '' *Funcionario: '' ||',
'       b.nmbre_trcro as dscrpcion_Lte,',
'       a.id_prcso_prssvo_lte',
'  from cb_g_procesos_persuasivo a, v_sg_g_usuarios b',
' where a.id_fncnrio = b.id_fncnrio',
'   and a.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_usrio = :F_ID_USRIO',
' order by a.id_prcso_prssvo_lte desc;',
''))
,p_colspan=>9
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Es el lote de selecci\00F3n realizado por un funcionario. Al consultarlo mostrara la informaci\00F3n de los candidatos, contenida en el lote para poder procesarla y generar el proceso jur\00EDdico.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(37239680815282001)
,p_name=>'P127_ID_PRCSOS_SMU_LTE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(138909683597587117)
,p_prompt=>unistr('Lote de Selecci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'                                                   ',
'select distinct''*Lote de Procesamiento: '' || a.ID_PRCSOS_SMU_LTE  as dscrpcion_Lte,',
'a.ID_PRCSOS_SMU_LTE',
'from cb_g_procesos_smu_mvmnto a ',
'order by a.ID_PRCSOS_SMU_LTE;',
''))
,p_colspan=>9
,p_display_when_type=>'NEVER'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('Es el lote de Procesamiento realizado por un funcionario. Al consultarlo mostrara la informaci\00F3n de los candidatos los cuales fueron cargados anteriormente desde selecci\00F3n puntual, cargue por lote masivo o en su defecto por cargue de EXCEL.')
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'60%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138909838600587119)
,p_name=>'P127_FCHA_DSDE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(138909683597587117)
,p_prompt=>'Fecha Desde'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'oninput="if (!this.value.match(/^\d{4}-\d{2}-\d{2}$/)) this.value = '''';"'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(138909928508587120)
,p_name=>'P127_FCHA_HSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(138909683597587117)
,p_prompt=>'Fecha Hasta'
,p_format_mask=>'DD/MM/YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_tag_attributes=>'oninput="if (!this.value.match(/^\d{4}-\d{2}-\d{2}$/)) this.value = '''';"'
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(17408492887919397)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_04=>'button'
,p_attribute_05=>'N'
,p_attribute_07=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(139398114730849505)
,p_name=>'P127_JSON'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(139400257857849526)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138911578849587136)
,p_name=>'Al cargar la pagina'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138911649449587137)
,p_event_id=>wwv_flow_api.id(138911578849587136)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(document).ready(function() {  ',
'    var region = apex.region("Actos_Persuasivos");',
'    if (region) {',
'        apex.region("Actos_Persuasivos").widget().interactiveGrid("setSelectedRecords", []);',
'    }',
'    validar_seleccion();      ',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138911784962587138)
,p_name=>unistr('Al cambiar la selecci\00F3n de filas')
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(139400257857849526)
,p_bind_type=>'bind'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138911852577587139)
,p_event_id=>wwv_flow_api.id(138911784962587138)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P127_JSON'
,p_attribute_01=>'validar_seleccion(true);'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(138912125752587142)
,p_name=>'Al dar click en BTN_GNERAR_ACTOS'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(138911265165587133)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(138912267470587143)
,p_event_id=>wwv_flow_api.id(138912125752587142)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'generarActos();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(2933541280971514)
,p_name=>'Al dar clic En BTN_EMAIL'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(2933335006971512)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(2933665341971515)
,p_event_id=>wwv_flow_api.id(2933541280971514)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function enviarMail() {',
'    var region = apex.region("actos");',
'    ',
'    if (region) {',
'        var view = region.widget().interactiveGrid("getViews", "grid");',
'        var model = view.model;',
'        ',
'        // Obtener los registros seleccionados',
'        var records = view.view$.grid("getSelectedRecords");',
'        ',
'        if (records.length > 0) {',
unistr('            // Construir el JSON validando que el EMAIL no est\00E9 vac\00EDo'),
'            var json = records.map(function(record) {',
'                return {                  ',
'                    "ID_ACTO": model.getValue(record, "ID_ACTO"),',
'                    "EMAIL": model.getValue(record, "EMAIL"),',
'                    "ID_PRCSOS_PRSSVO_RSPNSBLE": model.getValue(record, "ID_PRCSOS_PRSSVO_RSPNSBLE")///ANDY',
'                };       ',
'            }).filter(function(item) {',
unistr('                return item.EMAIL && item.EMAIL.trim() !== ""; // Validar que EMAIL no est\00E9 vac\00EDo'),
'            });',
'            ',
'            if (json.length === 0) {',
unistr('                apex.message.alert("No se pueden enviar los actos porque algunos registros no tienen un email v\00E1lido.");'),
'                return;',
'            }',
'',
'            console.log(JSON.stringify(json)); ',
'            ',
'            window.localStorage.setItem(''json'', json.length > 0 ? JSON.stringify(json) : '''');',
'            ',
'            try {',
unistr('                apex.message.confirm("\00BFDesea enviar estos actos por email?", async function(okPressed) { '),
'                    if (okPressed) {',
'                        var popup = apex.widget.waitPopup(); ',
'',
'                        try {',
'                            let data = await apex.server.process(',
'                                "enviarMail",',
'                                {    ',
'                                    f01: JSON.stringify(json), ',
'                                    pageItems: "#F_CDGO_CLNTE"',
'                                }',
'                            );',
'',
'                            popup.remove(); ',
'',
'                            if (data.o_cdgo_rspsta != 0) { ',
'                                apex.message.clearErrors();',
'                                apex.message.alert(data.o_mnsje_rspsta);',
'                            } else {',
'                                apex.message.alert("Se han enviado los actos de forma exitosa!", function() {',
'                                    apex.submit("BTN_EMAIL");',
'                                });',
'                            }',
'',
'                        } catch (error) {',
'                            popup.remove(); ',
'                            console.error("Error en la llamada al proceso del servidor:", error);',
unistr('                            apex.message.alert("Ocurri\00F3 un error durante el proceso de env\00EDo.");'),
'                        }',
'                    }',
'                });',
'            } catch (error) {',
'                console.error("Error general:", error);',
unistr('                apex.message.alert("Ocurri\00F3 un error al intentar enviar los actos.");'),
'            }',
'        } else {',
'            apex.message.alert("No hay registros seleccionados.");',
'        }',
'    } else {',
unistr('        apex.message.alert("No se pudo encontrar la regi\00F3n ''documentos''.");'),
'    }',
'}',
'',
'enviarMail();',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3904280506755707)
,p_name=>'Al dar Click en BTN_IMPRMIR_OFICIO'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(3903850952752468)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3904627523755710)
,p_event_id=>wwv_flow_api.id(3904280506755707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const merge_oficios_persuasivos = async () => {',
'    console.time(''loop'');',
'    let popup;',
'    try {',
'        // Mostrar el popup de espera',
'        popup = apex.widget.waitPopup();',
'',
'        // Obtener y validar los datos del localStorage',
'        let v_json = localStorage.getItem(''jsonActosPersuasivos'');',
'        if (!v_json) {',
'            apex.message.alert(''No existen datos en localStorage.'');',
'            return;',
'        }',
'',
'        let contentJson;',
'        try {',
'            contentJson = JSON.parse(v_json);',
'        } catch (error) {',
'            console.error(''Error al analizar el JSON:'', error);',
unistr('            apex.message.alert(''Los datos en localStorage no son v\00E1lidos.'');'),
'            return;',
'        }',
'',
'        const cantidad = contentJson.length;',
'        if (cantidad === 0) {',
'            apex.message.alert(''No existen documentos asociados.'');',
'            return;',
'        }',
'',
'        // Instanciar el PDF principal y las herramientas necesarias',
'        const PDFDocument = PDFLib.PDFDocument;',
'        const mergedPdf = await PDFDocument.create();',
'        let progress = 0;',
'',
'        // Validar los datos del servidor',
'        const { dataOficio } = await peticionServerProcess(''Valida_Resoluciones'', { f01: v_json });',
'        if (!dataOficio || dataOficio.length === 0) {',
'            apex.message.alert(''No se encontraron datos de oficio.'');',
'            return;',
'        }',
'',
'        // Procesar cada oficio',
'        const promises = dataOficio.map(async (oficio) => {',
'            const { data } = await peticionServerProcess(''prc_co_documentos_msvos'', { f01: JSON.stringify(oficio) });',
'            // Procesar cada documento en el oficio',
'            return Promise.all(data.map(async (doc) => {',
'                try {',
'                    const tem = await convertBase64ToFile(`data:application/pdf;base64,${doc.fileBlob}`, ''Documento'');',
'                    const document = await readFileAsync(tem);',
'                    const document2 = await PDFDocument.load(document);',
'',
unistr('                    // Copiar las p\00E1ginas al PDF principal'),
'                    const copiedPages = await mergedPdf.copyPages(document2, document2.getPageIndices());',
'                    copiedPages.forEach((page) => mergedPdf.addPage(page));',
'',
'                    // Actualizar progreso (si es necesario)',
'                    progress++;',
'                    console.log(`Progreso: ${progress}/${cantidad}`);',
'                } catch (error) {',
'                    console.error(''Error al procesar documento:'', error);',
'                }                ',
'            }));',
'        });',
'',
'        // Esperar a que todas las operaciones terminen',
'        await Promise.all(promises);',
'        // Generar y descargar el archivo ZIP',
'        await generateAndDownloadZip(mergedPdf, ''Oficios_Persuasivos'');',
'',
'        console.log(''Todos los documentos fueron procesados correctamente.'');',
'    } catch (error) {',
unistr('        console.error(''Ocurri\00F3 un error inesperado:'', error);'),
unistr('        apex.message.alert(''Hubo un error durante el procesamiento. Revisa la consola para m\00E1s detalles.'');'),
'    } finally {',
'        // Asegurar que el popup se elimine pase lo que pase',
'        popup?.remove();',
'        console.timeEnd(''loop'');',
'    }',
'};',
'        ',
'merge_oficios_persuasivos(); '))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3883232016930813)
,p_name=>'Al dar clic en BTN_CNSLTAR'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(138910464621587125)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3883394647930814)
,p_event_id=>wwv_flow_api.id(3883232016930813)
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
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4026530886593303)
,p_name=>'al dar clic en BTN_RCNSTRIR_ACTO'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(4026300071593301)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
end;
/
begin
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4026647222593304)
,p_event_id=>wwv_flow_api.id(4026530886593303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function reconstruir() {',
'    // Obtener el JSON de localStorage',
'    var json_actos = localStorage.getItem(''jsonActosPersuasivos'');',
unistr('    // Validar que exista y no est\00E9 vac\00EDo'),
'    if (!json_actos || json_actos.trim() === "") {',
'        apex.message.clearErrors();',
'        apex.message.alert(''No se han seleccionado registros a procesar.'');',
'        return;',
'    }',
'    console.log(''json_actos: '', json_actos);',
'',
'    apex.message.confirm(',
unistr('        "\00BFDesea generar los actos de cobro persuasivo para los registros seleccionados?",'),
'        async function (okPressed) {',
'            if (!okPressed) return;',
'',
'            // Mostrar el popup de espera',
'            var popup = apex.widget.waitPopup();',
'',
'            try {',
'                // Llamada al proceso de servidor',
'                let pData = await apex.server.process(',
'                    "ReconstruirActos",',
'                    {',
'                        f01: json_actos, ',
'                        pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO"',
'                    }',
'                );',
'',
'                // Verificar la respuesta del servidor',
'                if (pData.o_cdgo_rspsta != 0) {',
'                    apex.message.clearErrors();',
'                    apex.message.alert(pData.o_mnsje_rspsta);',
'                } else {',
'                    apex.message.alert(pData.o_mnsje_rspsta, function () {',
'                        apex.submit("BTN_RCNSTRIR_ACTO");',
'                    });',
'                }',
'            } catch (error) {',
'                console.error(''Error en el proceso del servidor:'', error);',
unistr('                apex.message.alert(''Ocurri\00F3 un error durante el procesamiento. Por favor, intente nuevamente.'');'),
'            } finally {',
'                // Asegurarse de remover el popup en cualquier caso',
'                if (popup) popup.remove();',
'            }',
'        }',
'    );',
'}',
'',
'reconstruir();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(9497951883945203)
,p_name=>'Al dar clien en BTN_OPEN_MODAL'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(9497874464945202)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(9498028715945204)
,p_event_id=>wwv_flow_api.id(9497951883945203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'openModal("notificacion");'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(9507674292054621)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_api.id(9505913200054604)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Actos - Save Interactive Grid Data'
,p_attribute_01=>'REGION_SOURCE'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_08=>'Y'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(139398625300849510)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMPRIMIR_ACTOS'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_json                      clob;',
'    v_url                       varchar2(4000);',
'    v_cdgo_rspsta               number;',
'    v_mnsje_rspsta              varchar2(4000);',
'    v_count                     number := 0;',
'    l_zip_file                  blob;',
'    v_nmbre_zip                 varchar2(100)	:= ''ActosPersuasivos.zip'';  ',
'    v_id_lte_mdda_ctlar         number          := 0;',
'	',
'begin',
'    ',
'    ',
'    begin',
'        ',
'        for c_actos in (select a.id_prcsos_prssvo_dcmnto',
'                                , c.file_blob',
'                                , c.file_name',
'                                , b.id_acto',
'                             from json_table( :P127_JSON  ,''$[*]''',
'                                    columns ( id_prcsos_prssvo_dcmnto number path ''$.ID'')) a',
'                            join cb_g_procesos_prssvo_dcmnto b on b.id_prcsos_prssvo_dcmnto = a.id_prcsos_prssvo_dcmnto',
'                            join v_gn_g_actos                   c on c.id_acto = b.id_acto) loop',
'			',
'	    v_count         := v_count + 1;',
'                        ',
unistr('            v_mnsje_rspsta  := ''Acto N\00B0: '' || v_count;'),
'            ',
'            -- Se agrega el blob al zip',
'            begin ',
'                apex_zip.add_file ( p_zipped_blob => l_zip_file',
'                                  , p_file_name   => c_actos.file_name',
'                                  , p_content     => c_actos.file_blob );',
'                ',
'                v_mnsje_rspsta  := ''Se agrego el Acto ID: '' || c_actos.id_prcsos_prssvo_dcmnto || '' al zip'';',
'            exception ',
'                when others then ',
'                    null;',
'                    ',
'            end;-- Fin Se agrega el blob al zip',
'		',
'        end loop;-- Fin Se recorre el json con las resoluciones de desembargo y se consulta el blob para agregarlo al zip',
'		',
'         -- Se finaliza el zip y se descarga',
'        begin ',
'            apex_zip.finish( p_zipped_blob =>  l_zip_file );',
'            owa_util.mime_header(''application/zip'', FALSE); ',
'            htp.p(''Content-length: ''|| dbms_lob.getlength(l_zip_file));',
'            htp.p(''Content-Disposition: attachment; filename="'' || v_nmbre_zip || ''"'');',
'            owa_util.http_header_close;',
'            wpg_docload.download_file(l_zip_file);',
'            ',
'        exception ',
'            when others then ',
'               null;',
'        end;-- Se finaliza el zip y se descarga',
'                ',
'     exception',
'            when others then',
'                null;                                               ',
'     end; ',
'     ',
'exception',
'    when others then',
'       null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'BTN_IMPRMIR_ACTOS'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(138912040577587141)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar_Actos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   o_cdgo_rspsta  number;',
'   o_mnsje_rspsta varchar2(2000);',
'   v_json_actos   clob;',
'begin',
'    ',
'    for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json_actos := v_json_actos||APEX_APPLICATION.g_f01(i);',
'    end loop;',
'    ',
'    insert into muerto (n_001,c_001,t_001) values (11122024, v_json_actos,systimestamp);commit;',
'        ',
unistr('    -- Generaci\00F3n de Actos persuasivos'),
'    pkg_cb_proceso_persuasivo.prc_gn_documento_persuasivo_job(p_cdgo_clnte           => :F_CDGO_CLNTE,',
'                                                              p_json_dcmntos_prrsvo  => v_json_actos,',
'                                                              p_id_usrio             => :F_ID_USRIO,',
'                                                              o_cdgo_rspsta          => o_cdgo_rspsta,',
'                                                              o_mnsje_rspsta         => o_mnsje_rspsta);',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object();',
'',
'exception',
'    when others then',
'            apex_json.open_object();',
'            apex_json.write(''o_cdgo_rspsta'', 99);',
'            apex_json.write(''o_mnsje_rspsta'', ''Error al generar actos.''||sqlerrm);',
'            apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(2933765428971516)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'enviarMail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  ',
'  o_cdgo_rspsta  number;',
'  o_mnsje_rspsta varchar2(4000);',
'  v_json_actos   clob;',
'  v_exception    exception;',
'  ',
'begin',
'',
'    ',
'	for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json_actos := v_json_actos||APEX_APPLICATION.g_f01(i);',
'    end loop;',
'',
'  pkg_cb_proceso_persuasivo.prc_gn_envio_email(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                               p_json_actos   =>  v_json_actos,',
'                                               o_cdgo_rspsta  =>  o_cdgo_rspsta,',
'                                               o_mnsje_rspsta =>  o_mnsje_rspsta);',
'                                               ',
'if o_cdgo_rspsta <> 0 then',
'       raise v_exception;     ',
'    end if;',
'  ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta); ',
'    apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'    apex_json.close_object;',
'',
'	exception',
'	    when v_exception then',
'			rollback;',
'			apex_json.open_object;',
'			apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'			apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'			apex_json.close_object;                                                  ',
'  ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3882591074930806)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Valida_Resoluciones'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_json         clob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(4000);',
'  v_id_rslcion   number := apex_application.g_x01;',
'  v_error        exception;',
'begin',
'',
'  -- Inicializar v_json',
'  v_json := empty_clob();',
'',
'  -- Validar que haya datos en g_f01',
'  if apex_application.g_f01.count = 0 then',
unistr('    v_mnsje_rspsta := ''No se recibi\00F3 ning\00FAn dato para procesar.'';'),
'    raise v_error;',
'  end if;',
'',
'  -- Construir el JSON desde g_f01',
'  begin',
'    for i in 1 .. apex_application.g_f01.count loop',
'      v_json := v_json || apex_application.g_f01(i);',
'    end loop;',
'  exception',
'    when others then',
'      v_mnsje_rspsta := ''Error al Construir el JSON desde g_f01. '' ||',
'                        sqlerrm;',
'      raise v_error;',
'  end;',
'',
'  -- Validar formato del JSON de entrada',
'  if json_exists(v_json, ''$[*]'') then    ',
'  ',
'    -- Generar el JSON de salida',
'    apex_json.open_object;',
'    apex_json.open_array(''dataOficio'');',
'  ',
'    begin',
'      ',
'      for c_oficios in (select distinct a.id_acto',
'                          from v_gn_g_actos a',
'                         where a.id_acto in',
'                               (select id_acto',
'                                  from json_table(v_json,',
'                                                  ''$[*]''',
'                                                  columns(ID_ACTO number path',
'                                                          ''$.ID_ACTO'')))',
'                         order by a.id_acto asc) loop',
'        ',
'        apex_json.open_object;',
'        apex_json.write(''ID_ACTO'', c_oficios.id_acto);',
'        apex_json.close_object;',
'        ',
'      end loop;',
'    ',
'    exception',
'      when no_data_found then',
'        v_mnsje_rspsta := ''No se encontraron actos asociados.'';',
'        raise v_error;',
'      when others then',
unistr('        v_mnsje_rspsta := ''Ocurri\00F3 un error durante la consulta.'';'),
'        raise v_error;',
'    end;',
'  ',
'    apex_json.close_array;',
'    apex_json.close_object;',
'  else',
'    v_mnsje_rspsta := ''El JSON no tiene el formato esperado.'';',
'    raise v_error;',
'  end if;',
'',
'exception',
'  when v_error then',
'    apex_json.open_object;',
'    apex_json.write(''Respuesta: '', v_mnsje_rspsta);',
'    apex_json.close_object;',
'  when others then',
'    apex_json.open_object;',
'    apex_json.write(''error'',',
unistr('                    ''Ocurri\00F3 un error inesperado. Verifique los datos.'');'),
'    apex_json.close_object;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(3882673160930807)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_documentos_msvos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  cadena         varchar2(100) := '''';',
'  l_clob         CLOB;',
'  v_json         clob;',
'  v_archvo_blob  blob;',
'  v_cdgo_rspsta  number;',
'  v_mnsje_rspsta varchar2(1000);',
'begin',
'  v_json := empty_clob();',
'',
'  for i in 1 .. APEX_APPLICATION.g_f01.count loop',
'    v_json := v_json || APEX_APPLICATION.g_f01(i);',
'  end loop;',
'',
'  apex_json.open_object;',
'  apex_json.open_array(''data'');',
'  ',
'  for c_document in (select b.file_blob,',
'                            b.file_name,',
'                            b.file_bfile,',
'                            a.nmro_acto',
'                       from gn_g_actos a',
'                       join gd_g_documentos b',
'                         on a.id_dcmnto = b.id_dcmnto',
'                       join json_table(v_json, ''$'' columns(id_acto NUMBER path ''$.ID_ACTO'')) as x',
'                         on x.id_acto = a.id_acto',
'                      order by a.nmro_acto asc) loop                   ',
'                                                      ',
'      if c_document.file_blob is null then',
'      ',
'      pkg_gd_utilidades.prc_co_archco_dsco(p_bfile        => c_document.file_bfile,',
'                                           o_archvo_blob  => v_archvo_blob,',
'                                           o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                           o_mnsje_rspsta => v_mnsje_rspsta);',
'                                           ',
'      l_CLOB := apex_web_service.blob2clobbase64(v_archvo_blob);',
'    else',
'      l_CLOB := apex_web_service.blob2clobbase64(c_document.file_blob);',
'    end if;    ',
'      ',
'    apex_json.open_object; ',
'    apex_json.write(''fileBlob'', l_CLOB); ',
'    apex_json.write(''fileName'', c_document.file_name); ',
'    apex_json.close_object; ',
'  ',
'  end loop;',
'  apex_json.close_all;',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4026499961593302)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ReconstruirActos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta   number;',
'    v_mnsje_rspsta  varchar2(4000);',
'    v_json_actos   clob;',
'begin',
'    ',
'    for i in 1..APEX_APPLICATION.g_f01.count loop',
'       v_json_actos := v_json_actos||APEX_APPLICATION.g_f01(i);',
'    end loop;',
'    ',
'    pkg_cb_proceso_persuasivo.prc_gn_blob_prssvo(p_cdgo_clnte   => :F_CDGO_CLNTE,',
'                                                 p_json_actos   => v_json_actos,',
'                                                 p_id_usrio     => :F_ID_USRIO,',
'                                                 o_cdgo_rspsta  => v_cdgo_rspsta,',
'                                                 o_mnsje_rspsta => v_mnsje_rspsta);',
'',
'    apex_json.open_object();',
'    apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'    apex_json.close_object();',
'',
'exception',
'    when others then',
'        rollback;',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'        apex_json.write(''o_mnsje_rspsta'', v_mnsje_rspsta);',
'        apex_json.close_object();',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
