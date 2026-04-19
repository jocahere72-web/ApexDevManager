prompt --application/pages/page_00059
begin
wwv_flow_api.create_page(
 p_id=>59
,p_user_interface_id=>wwv_flow_api.id(177366559650050652)
,p_name=>unistr('Tipo de Impresi\00F3n de Lote')
,p_page_mode=>'MODAL'
,p_step_title=>unistr('Tipo de Impresi\00F3n de Lote')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#pdf-lib.min.js',
'#APP_IMAGES#jszip.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Generacion de documetos */',
'const peticionServerProcess = (proc, json) => {',
'    return apex.server.process(proc, json);',
'}',
'',
'function toBinary(string) {',
'  const codeUnits = new Uint16Array(string.length);',
'  for (let i = 0; i < codeUnits.length; i++) {',
'    codeUnits[i] = string.charCodeAt(i);',
'  }',
'  const charCodes = new Uint8Array(codeUnits.buffer);',
'  let result = '''';',
'  for (let i = 0; i < charCodes.byteLength; i++) {',
'    result += String.fromCharCode(charCodes[i]);',
'  }',
'  return result;',
'}',
'',
'const convertBase64ToFile = (base64String, fileName) => {',
' let arr = base64String.split('','');',
' let mime = arr[0].match(/:(.*?);/)[1];',
'console.log(mime)',
' //const converted = toBinary(arr[1]);',
' //const encoded = btoa(converted);',
' let bstr = atob(arr[1]);',
' let n = bstr.length;',
' let uint8Array = new Uint8Array(n);',
' while (n--) {',
'    uint8Array[n] = bstr.charCodeAt(n);',
' }',
' let file = new File([uint8Array], fileName, { type: mime });',
'console.log(file)',
' return file;',
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
'/* Metodo de union de documentos */',
'const merge = async () => {',
'  console.time(''loop'');',
'  let popup = apex.widget.waitPopup();',
'  const { data } = await peticionServerProcess(''prc_co_dcmnto'', {});',
'  console.log(data);',
'  if (data.length > 0) {',
'    let PDFDocument = PDFLib.PDFDocument;',
'    const mergedPdf = await PDFDocument.create();',
'    let i = 0;',
'    let respData = [];',
'    while (i < data.length) {',
'      const { fileBlob } = await peticionServerProcess(''prc_cr_dcmnto'', { x01: data[i].idDocumeto });',
'      console.log(`# de datos => ${data.length}`)',
'      //let j = 0',
'      console.log(''data => '', fileBlob)',
'      //while (j < data.length) {',
'      let tem = await convertBase64ToFile(`data:application/pdf;base64,${fileBlob}`, ''documento'');',
'      const document = await readFileAsync(tem);',
'      console.log(''Llegue hasta los metodos de pdflib'')',
'      const document2 = await PDFDocument.load(document);',
'      let copiedPages = await mergedPdf.copyPages(document2, document2.getPageIndices());',
'      copiedPages.forEach((page) => mergedPdf.addPage(page));',
'      // j++;',
'      //}',
'      respData = respData.concat(data)',
'      i++;',
'    }',
'    const mergedPdfFile = await mergedPdf.save();',
'    let zip = new JSZip();',
'    zip.file(`Gestion_impresion_masiva.pdf`, mergedPdfFile);',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Gestion_impresion_masiva.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
'  } else {',
'    alert(''No existen documentos asociados.'')',
'  }',
'  console.log(''1. SALE IF'');',
'  popup.remove();',
'}',
'',
'',
'/*const merge_2 = async () => {',
'  console.time(''entramos al merge2'');',
'  let popup = apex.widget.waitPopup();',
'  let zip = new JSZip();',
'  //let v_json = localStorage.getItem(''P10_JSON'');',
'  //let contentJson = JSON.parse(v_json)',
'  //let array = JSON.parse(v_json);',
'  //let cantidad = array.length;',
'  let contador = 0;',
'      const { data } = await peticionServerProcess(''prc_co_dcmnto'', {});',
'      console.log(`# de datos => ${data.length}`)',
'      let j = 0',
'      while (j < data.length) {',
'          console.time(''hay datos'');',
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
'        zip.file(`${data[j].fileName}.pdf`, file);',
'        contador++;',
'        j++;',
'      }',
'      respData = respData.concat(data)',
'      i = i + 20;',
'    ',
'      ',
'    zip.generateAsync({ type: "blob" }).then(mergedPdfFile => {',
'      download(mergedPdfFile, `Gestion_de_proceso_juridico_individual.zip`, ''application/zip'');',
'    });',
'    console.timeEnd(''loop''); // Muestra por consola: "loop: 63ms"',
' ',
'  popup.remove();',
'}*/',
'',
''))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'IBRUNAL'
,p_last_upd_yyyymmddhh24miss=>'20220208113920'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(35239517891664805)
,p_plug_name=>unistr('Tipo de Impresi\00F3n. Rangos lote: &P59_RANGO_INICIAL. al &P59_RANGO_FINAL.')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(177332998617050607)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10033968171312203)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(35239517891664805)
,p_button_name=>'BTN_GNRA_DCMNTO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Generar Documento'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_prcsado from re_g_documentos_lote_job',
'where id_dcmnto_lte = :P59_ID_DCMNTO_LTE',
'  and indcdor_prcsado = ''S'''))
,p_button_condition_type=>'NOT_EXISTS'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(35239720162664807)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_api.id(35239517891664805)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(177355914201050632)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Imprimir documentos'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select indcdor_prcsado from re_g_documentos_lote_job',
'where id_dcmnto_lte = :P59_ID_DCMNTO_LTE',
'  and indcdor_prcsado = ''S'''))
,p_button_condition_type=>'EXISTS'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
,p_grid_column=>8
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(61246348521486544)
,p_branch_name=>unistr('Ir a P\00E1gina 2')
,p_branch_action=>'f?p=66000:2:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35239720162664807)
,p_branch_sequence=>40
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(61246519813486546)
,p_branch_name=>unistr('Ir a P\00E1gina 59')
,p_branch_action=>'f?p=&APP_ID.:59:&SESSION.:ZIP:&DEBUG.:RP,59:P59_ID_RPRTE,P59_IMPRSION_TPO,P59_ID_DCMNTO_LTE,P59_ID_RPRTE_PRMTRO:&P59_ID_RPRTE.,&P59_IMPRSION_TPO.,&P59_ID_DCMNTO_LTE.,&P59_ID_RPRTE_PRMTRO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(35239720162664807)
,p_branch_sequence=>50
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13497228392667903)
,p_name=>'P59_RPRTE_ID'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13497456768667905)
,p_name=>'P59_NMBRE_DC'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(13499607366667927)
,p_name=>'P59_JOB'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_prompt=>unistr('Tipo Programaci\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Inmediato;A,Programado;P'
,p_colspan=>5
,p_grid_column=>1
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'v_nmro_rgstro_prcsar number;',
'v_nmro_mxmo_sncrno   number;',
'v_indcdor_prcsado    varchar2(100);',
'',
'',
'begin',
'',
'select count(id_dcmnto)',
'into v_nmro_rgstro_prcsar',
'from re_g_documentos',
'where id_dcmnto_lte = :P59_ID_DCMNTO_LTE;',
'',
'begin',
'    select indcdor_prcsado',
'    into v_indcdor_prcsado',
'    from re_g_documentos_lote_job',
'    where id_dcmnto_lte = :P59_ID_DCMNTO_LTE',
'      and indcdor_prcsado = ''S'' and ROWNUM < 2;',
'exception',
'    when others then',
'    v_indcdor_prcsado :=''N'';',
'end;',
'',
'',
'select nmro_rgstro_mxmo_sncrno',
'into v_nmro_mxmo_sncrno',
'from re_d_configuraciones_gnral',
'where cdgo_clnte = :F_CDGO_CLNTE;',
'',
'',
'if (v_nmro_rgstro_prcsar <= v_nmro_mxmo_sncrno  ) then',
'    return false;',
'    ',
'elsif( v_indcdor_prcsado= ''S'' ) then ',
'    return false;',
'    ',
'    else',
'    return true;',
'end if;',
'',
'end;'))
,p_display_when_type=>'FUNCTION_BODY'
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35239669054664806)
,p_name=>'P59_IMPRSION_TPO'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_item_default=>'ARCHIVO'
,p_prompt=>unistr('Tipo de Impresi\00F3n')
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Un Solo Archivo;ARCHIVO,Comprimido;ZIP'
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'2'
,p_attribute_02=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(35240023652664810)
,p_name=>'P59_ID_DCMNTO_LTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(50389410952562007)
,p_name=>'P59_ID_RPRTE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_prompt=>'Plantilla'
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select nmbre_rprte d ,',
'        id_rprte r',
'   from gn_d_reportes',
'  where cdgo_rprte_grpo = ''RPG''',
'    --and actvo = ''S'''))
,p_lov_display_null=>'YES'
,p_grid_label_column_span=>2
,p_field_template=>wwv_flow_api.id(177355467780050629)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'100%'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(117852450570338202)
,p_name=>'P59_ID_RPRTE_PRMTRO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141337724551327306)
,p_name=>'P59_RANGO_INICIAL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(141337822485327307)
,p_name=>'P59_RANGO_FINAL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(35239517891664805)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(13497524076667906)
,p_computation_sequence=>20
,p_computation_item=>'P59_NMBRE_DC'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'SELECT :P59_ID_DCMNTO_LTE FROM DUAL;'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(13497628753667907)
,p_computation_sequence=>30
,p_computation_item=>'P59_RPRTE_ID'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select :P59_ID_RPRTE FROM DUAL;',
''))
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(8071061353000323)
,p_name=>'generar documento'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(35239720162664807)
,p_condition_element=>'P59_ID_RPRTE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(8071192569000324)
,p_event_id=>wwv_flow_api.id(8071061353000323)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''La impresi\00F3n del lote de documentos se realizar\00E1 en segundo plano. En cuanto termine el procesamiento el sistema le notificara de manera autom\00E1tica que este ha terminado. '',function(okPressed) {'),
'',
'        if (okPressed) {            ',
'           merge();       ',
'        }',
'        ',
'    else{',
unistr('        apex.message.alert("La Acci\00F3n ha sido cancelada");'),
'        ',
'    }',
'',
'    })',
'',
'',
'',
'',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(10033710867312201)
,p_name=>'Refrescar item'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_ID_RPRTE'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(10033857226312202)
,p_event_id=>wwv_flow_api.id(10033710867312201)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13498354852667914)
,p_name=>'generar_jobs'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10033968171312203)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13498493236667915)
,p_event_id=>wwv_flow_api.id(13498354852667914)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm(''\00BFEst\00E1 seguro de procesar el lote de documentos? Nota: Al aceptar, la generaci\00F3n de documentos ser\00E1 programada por el sistema. Una vez finalice, el sistema le notificar\00E1 via EMAIL. '',function(okPressed) {'),
'',
'        if (okPressed) {   ',
'           ',
'           apex.navigation.dialog.close(true);',
'            ',
'        }',
'    else{',
unistr('        apex.message.alert("La Acci\00F3n ha sido cancelada");'),
'        apex.navigation.dialog.close(true);',
'    }',
'',
'    })',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13499031786667921)
,p_name=>'prcsar_dcmntos'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10033968171312203)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13499115906667922)
,p_event_id=>wwv_flow_api.id(13499031786667921)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta 	number;',
'    v_mnsje_rspsta 	varchar2(4000);',
'    val             number;',
'    v_correo        varchar2(1000);',
'    v_hora          number;',
'    v_indcdor_hra   varchar(2);',
'    ',
'begin',
'',
'    BEGIN',
'        ',
'        select email ',
'        into v_correo ',
'        from v_sg_g_usuarios',
'        where id_usrio = :F_ID_USRIO; ',
'        ',
'    ',
'        select hora_job ',
'        into v_hora ',
'        from re_d_configuraciones_gnral;',
'        ',
'        if (v_hora> 12) then',
'            v_indcdor_hra:=''pm'';',
'            ',
'        else',
'            v_indcdor_hra:=''am'';',
'        end if;',
'        ',
'        ',
'        ',
'        val := APEX_UTIL.FIND_SECURITY_GROUP_ID (p_workspace=>''INFORTRIBUTOS'');',
'        apex_util.set_security_group_id(p_security_group_id => val);',
'        ',
'      ',
'        ',
unistr('        --- proceso que generar\00E1 los jobs'),
'        pkg_re_documentos.prc_gn_documentos_masivos_blob( p_cdgo_clnte              => :F_CDGO_CLNTE',
'                                                        , p_id_dcmnto_lte           => :P59_ID_DCMNTO_LTE',
'                                                        , p_id_usrio		        => :F_ID_USRIO',
'                                                        , p_id_rprte                => :P59_ID_RPRTE',
'                                                        , p_nmbre_usrio             => :F_NMBRE_USRIO',
'                                                        , p_frmto_mnda              => :F_FRMTO_MNDA',
'                                                        , p_indcdor_hra_ejccion     => :P59_JOB',
'                                                        , o_cdgo_rspsta             => v_cdgo_rspsta',
'                                                        , o_mnsje_rspsta	        => v_mnsje_rspsta',
'                                                       );                                                   ',
'         if v_cdgo_rspsta <> 0 then',
'             raise_application_error(-20000, ''Codigo Respuesta: ''||v_cdgo_rspsta||'' - Mensaje Respuesta: ''||v_mnsje_rspsta);',
'         end if;',
'         ',
'         ',
'       ',
'        ',
'        if (:P59_JOB=''A'') then',
'     ',
'            apex_mail.send(',
'                                p_to        =>  v_correo,',
'                                p_from      => ''infortributos.sas@gmail.com'',  ',
unistr('                                p_subj      => ''INICIO DE PROCESO DE GENERACI\00D3N DE RECIBOS DE PAGOS MASIVOS'','),
unistr('                                p_body      => ''INICIO DE PROCESO DE GENERACI\00D3N DE RECIBOS DE PAGOS MASIVOS'','),
unistr('                                p_body_html => ''Estimado usuario,</br> Ud. Ha iniciado el proceso de generaci\00F3n Masiva de recibos de pago. </br>Este proceso comenzar\00E1 de INMEDIATO y podr\00EDa tardar muchos minutos. </br>El sistema le notificar\00E1 la culmi')
||unistr('naci\00F3n de este. Gracias'');'),
'        APEX_MAIL.PUSH_QUEUE;',
'       ',
'       elsif (:P59_JOB=''P'') then',
'       ',
'           apex_mail.send(',
'                                p_to        => v_correo,',
'                                p_from      => ''infortributos.sas@gmail.com'',  ',
unistr('                                p_subj      => ''INICIO DE PROCESO DE GENERACI\00D3N DE RECIBOS DE PAGOS MASIVOS'','),
unistr('                                p_body      => ''INICIO DE PROCESO DE GENERACI\00D3N DE RECIBOS DE PAGOS MASIVOS'','),
unistr('                                p_body_html => ''Estimado usuario,</br> Ud. Ha iniciado el proceso de generaci\00F3n Masiva de recibos de pago. </br>Este proceso comenzar\00E1 a las ''||TO_CHAR(v_hora)||'':00 y podr\00EDa tardar muchos minutos. </br>El sistema le n')
||unistr('otificar\00E1 la culminaci\00F3n de este. Gracias'');'),
'        APEX_MAIL.PUSH_QUEUE;',
'       ',
'       end if;',
'        ',
'        ',
'        ',
'        ',
'       ',
'    END; ',
'    ',
'   ',
'end;'))
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(13499815098667929)
,p_name=>'Enviar_valor'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P59_JOB'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(13499969864667930)
,p_event_id=>wwv_flow_api.id(13499815098667929)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(35239855502664808)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir un solo Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_dcmntos    clob;',
'begin',
'    :F_ID_DCMNTO :=  0; ',
'    begin ',
'        select listagg (id_dcmnto, ''!'' ) within group (order by id_dcmnto) id_dcmnto',
'          into :F_ID_DCMNTO',
'          from re_g_documentos ',
'          where id_dcmnto_lte = :P59_ID_DCMNTO_LTE;',
'    exception ',
'        when no_data_found then ',
'            :F_ID_DCMNTO :=  ''<data></data>'';',
'    end; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35239720162664807)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(50389586551562008)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir en un comprimido'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'    v_id_dcmntos    clob;',
'    v_xml           clob;',
'begin',
'    :F_ID_DCMNTO :=  0; ',
'    begin ',
'        for c_dcmntos_lte in (select id_dcmnto, nmro_dcmnto, id_dcmnto_lte',
'                                from re_g_documentos',
'                               where id_dcmnto_lte = :P59_ID_DCMNTO_LTE) loop',
'            v_xml := v_xml || ''<data><P_ID_DCMNTO>'' || c_dcmntos_lte.id_dcmnto || ''</P_ID_DCMNTO>'' ||',
'                                   ''<nmbre_rprte>documento_'' || c_dcmntos_lte.nmro_dcmnto ||  ''</nmbre_rprte>'' || ',
'                               ''</data>'';',
'        end loop;',
'          :F_ID_DCMNTO :=  v_xml;',
'    exception ',
'        when no_data_found then ',
'          :F_ID_DCMNTO :=  ''<data></data>'';',
'    end; ',
'end;',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35239720162664807)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(117852349443338201)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Construir XML'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_dta            clob;',
'    v_cdgo_rspsta    number;',
'    v_mnsje_rspsta   varchar2(100);',
'begin',
'    ',
'    :P59_ID_RPRTE_PRMTRO  := pkg_gn_generalidades.fnc_ge_id_rprte_prmtro();',
'        ',
'    for c_rcbos_msvos in (select id_dcmnto, nmro_dcmnto, id_dcmnto_lte',
'                                from re_g_documentos',
'                               where id_dcmnto_lte = :P59_ID_DCMNTO_LTE',
'        ',
'        ',
'        ',
'                           ) loop',
'    ',
'       v_dta  := ''<P_ID_DCMNTO>''     || c_rcbos_msvos.id_dcmnto || ''</P_ID_DCMNTO>''    || ',
'                  ''<nmbre_rprte> ''         ||''Documento_''||c_rcbos_msvos.nmro_dcmnto  || ''</nmbre_rprte>'';',
'                  ',
'             ',
'        pkg_gn_generalidades.prc_rg_t_reportes_parametro(:P59_ID_RPRTE_PRMTRO,',
'                                                          v_dta,',
'                                                          v_cdgo_rspsta,',
'										                  v_mnsje_rspsta );',
'                                                      ',
'    end loop;',
'  ',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35239720162664807)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(61246289746486543)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir un Solo Archivo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare    ',
'    v_array_id_dcmnto  json_array_t  := json_array_t();    ',
'begin',
'    :F_ID_DCMNTO :=  0; ',
'    begin ',
'        for c_id_dcmntos in (',
'                                select id_dcmnto--listagg (id_dcmnto, ''!'' ) within group (order by id_dcmnto) id_dcmnto',
'                                  from re_g_documentos ',
'                                 where id_dcmnto_lte = :P59_ID_DCMNTO_LTE',
'                                 and   nmro_dcmnto between nvl(:P59_RANGO_INICIAL,nmro_dcmnto) and nvl(:P59_RANGO_FINAL,nmro_dcmnto)',
'                             ) loop',
'            ',
'            v_array_id_dcmnto.append(c_id_dcmntos.id_dcmnto);',
'        end loop;  ',
'        :F_ID_DCMNTO := v_array_id_dcmnto.to_clob();',
'    exception ',
'        when no_data_found then ',
'            :F_ID_DCMNTO := null;',
'        when others then',
'            raise_application_error(-20000, ''Error, no puede superar el limite'');',
'    end; ',
'    --dbms_output.put_line(F_ID_DCMNTO);',
'    ',
'    --:F_ID_DCMNTO := :P59_ID_DCMNTO_LTE;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35239720162664807)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(10046147536610201)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar lote documento job'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_rspsta 	number;',
'    v_mnsje_rspsta 	varchar2(4000);',
'begin',
'',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO"'', attribute => ''job_action'', value => ''PKG_RE_DOCUMENTOS.PRC_GN_DCMNTO_MASIVO_PAGO'');',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO"'', attribute => ''number_of_arguments'', value => ''6'');',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 2, argument_value => :P59_ID_DCMNTO_LTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 3, argument_value => :P59_ID_RPRTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 4, argument_value => :F_NMBRE_USRIO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 5, argument_value => :F_FRMTO_MNDA);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 6, argument_value => :F_ID_USRIO);',
'       ',
'        ',
'    END; ',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO"'');',
'    END; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(10033968171312203)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(15014804930799303)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Procesar_Documentos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*declare',
'    v_cdgo_rspsta 	number;',
'    v_mnsje_rspsta 	varchar2(4000);',
'begin',
'    pkg_re_documentos.prc_gn_dcmnto_masivo_pago(  p_cdgo_clnte      => :F_CDGO_CLNTE',
'                                                , p_id_dcmnto_lte   => :P59_ID_DCMNTO_LTE',
'                                                , p_id_rprte        => :P59_ID_RPRTE',
'                                                , p_nmbre_usrio     => :F_NMBRE_USRIO',
'                                                , p_frmto_mnda      => :F_FRMTO_MNDA',
'                                                , p_id_usrio		=> :F_ID_USRIO',
'                                                , o_cdgo_rspsta     => v_cdgo_rspsta',
'                                                , o_mnsje_rspsta	=> v_mnsje_rspsta',
'                                               );     ',
'     if v_cdgo_rspsta <> 0 then',
'         raise_application_error(-20000, ''Codigo Respuesta: ''||v_cdgo_rspsta||'' - Mensaje Respuesta: ''||v_mnsje_rspsta);',
'     end if;',
'end;',
'*/',
'declare',
'    v_cdgo_rspsta 	number;',
'    v_mnsje_rspsta 	varchar2(4000);',
'begin',
'',
'    BEGIN',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO"'', attribute => ''job_action'', value => ''PKG_RE_DOCUMENTOS.PRC_GN_DCMNTO_MASIVO_PAGO'');',
'        DBMS_SCHEDULER.set_attribute( name => ''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO"'', attribute => ''number_of_arguments'', value => ''6'');',
'',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 1, argument_value => :F_CDGO_CLNTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 2, argument_value => :P59_ID_DCMNTO_LTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 3, argument_value => :P59_ID_RPRTE);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 4, argument_value => :F_NMBRE_USRIO);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 5, argument_value => :F_FRMTO_MNDA);',
'        DBMS_SCHEDULER.SET_JOB_ARGUMENT_VALUE ( job_name => ''IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO'', argument_position => 6, argument_value => :F_ID_USRIO);',
'    END; ',
'    ',
'    BEGIN',
'        DBMS_SCHEDULER.ENABLE(''"GENESYS"."IT_GI_PRC_DOCUMENTOS_MASIVOS_PAGO"'');',
'        insert into muerto (n_001,v_001) values(333,''ejecutando el job''); commit;',
'    END; ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(10033968171312203)
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(61246408663486545)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir ZIP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_app_id        number                     := v(''APP_ID'');',
'    v_app_page_id   number                     := v(''APP_PAGE_ID'');',
'    v_cdgo_clnte df_s_clientes.cdgo_clnte%type := :F_CDGO_CLNTE;',
'    v_gn_d_reportes gn_d_reportes%rowtype;',
'    v_app_id_dstno  number := 66000;',
'    v_zip_file      blob;',
'begin',
'',
'    --Busca los Datos del Reporte',
'    begin',
'        select /*+ RESULT_CACHE */ a.*',
'          into v_gn_d_reportes',
'          from gn_d_reportes a',
'         where id_rprte = :P59_ID_RPRTE;',
'    exception',
'        when no_data_found then',
'             return;',
'    end;',
'    ',
'    apex_session.attach( p_app_id     => v_app_id_dstno',
'                       , p_page_id    => 2',
'                       , p_session_id => v(''APP_SESSION''));',
'                       insert into muerto (n_001,v_001) values(101,''sesion creada'');commit;',
'    ',
'    apex_util.set_session_state( ''F_CDGO_CLNTE'' , v_cdgo_clnte );',
'                           ',
'    for c_dcmntos_lte in (    ',
'                             select id_dcmnto',
'                                  , nmro_dcmnto',
'                                  , id_dcmnto_lte',
'                               from re_g_documentos',
'                              where id_dcmnto_lte = :P59_ID_DCMNTO_LTE ',
'                        ) loop',
'                        ',
unistr('                        insert into muerto (n_001,v_001) values(101,''entr\00F3 al loop del cursor'');commit;'),
'        ',
'        apex_util.set_session_state( ''F_ID_DCMNTO'' , c_dcmntos_lte.id_dcmnto );',
'        ',
'        declare',
'            v_blob blob;',
'        begin',
unistr('            insert into muerto (n_001,v_001) values(101,''ent\00F3 al begin de get_print'');commit;'),
'            v_blob := apex_util.get_print_document( p_application_id     => v_app_id_dstno',
'                                                  , p_report_query_name  => v_gn_d_reportes.nmbre_cnslta',
'                                                  , p_report_layout_name => v_gn_d_reportes.nmbre_plntlla',
'                                                  , p_report_layout_type => v_gn_d_reportes.cdgo_frmto_plntlla',
'                                                  , p_document_format    => v_gn_d_reportes.cdgo_frmto_tpo );',
'                                                  insert into muerto (n_001,v_001) values(101,''hizo el zip'');commit;',
'            ',
'            apex_zip.add_file ( p_zipped_blob => v_zip_file',
'                              , p_file_name   => c_dcmntos_lte.nmro_dcmnto || ''.'' || lower( v_gn_d_reportes.cdgo_frmto_tpo ) ',
'                              , p_content     => v_blob );',
'                              insert into muerto (n_001,v_001) values(101,''union los zip'');commit;',
'        end;',
'    end loop;',
'    ',
'    apex_zip.finish( p_zipped_blob => v_zip_file );',
'    ',
'    owa_util.mime_header(''application/zip'', false); ',
'    ',
'    htp.p(''Content-length: ''|| dbms_lob.getlength(v_zip_file));',
'   ',
unistr('    htp.p(''Content-Disposition: attachment; filename="'' || ''Lote N\00B0'' || :P59_ID_DCMNTO_LTE || ''.zip"'');'),
'   ',
'    owa_util.http_header_close;',
'    ',
'    wpg_docload.download_file(v_zip_file);',
'',
'    apex_session.attach( p_app_id     => v_app_id',
'                       , p_page_id    => v_app_page_id',
'                       , p_session_id => v(''APP_SESSION''));',
'                           ',
'                           insert into muerto (n_001,v_001) values(101,''sesion attach'');commit;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(35239720162664807)
,p_process_when=>'ZIP'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(141337654643327305)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtien rangos del lote'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  min(nmro_dcmnto), max(nmro_dcmnto)',
'into    :P59_RANGO_INICIAL, :P59_RANGO_FINAL',
'from    re_g_documentos',
'where   id_dcmnto_lte = :P59_ID_DCMNTO_LTE',
';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8070820893000321)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_cr_dcmnto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_id_dcmnto number := APEX_APPLICATION.G_X01;',
'  v_blob blob;',
'  v_clob clob;',
'  v_cdgo_rspsta number;',
'  v_mnsje_rspsta varchar2(4000);',
'begin',
'insert into muerto (v_001, n_001, b_001, c_001) values (''valor del documento => '' || v_id_dcmnto || '', app id => '' || :APP_ID, 101, v_blob, v_clob); commit;',
'   /*begin',
'        prc_gn_dcmnto_pago_1(',
'                        p_id_rprte       => :P59_ID_RPRTE,',
'                        p_cdgo_clnte => :F_CDGO_CLNTE,',
'                        p_id_dcmnto => v_id_dcmnto,',
'                        p_nmbre_usrio => :F_NMBRE_USRIO,',
'                        p_frmto_mnda => :F_FRMTO_MNDA,',
'                        o_blob => v_blob,',
'                        o_cdgo_rspsta => v_cdgo_rspsta,',
'                        o_mnsje_rspsta => v_mnsje_rspsta',
'                      );',
'    exception when no_data_found then',
'              raise_application_error( -20001 , ''El reporte no existe en el sistema.'' );',
'    end; */',
'    ',
'    select a.file_blob into v_blob from gd_g_documentos a    ',
'      where a.id_dcmnto = v_id_dcmnto;',
'    ',
'    v_clob := apex_web_service.blob2clobbase64(v_blob);',
'    insert into muerto (v_001, n_001, b_001, c_001) values (''valor del documento => '' || v_id_dcmnto || '', app id => '' || :APP_ID, 101, v_blob, v_clob); commit;',
'    apex_json.open_object;        -- {',
'    apex_json.write(''fileBlob'', v_clob); --      "fileBlob": documento en blob',
'    apex_json.close_object;   --    }',
'    ',
'exception when others then',
'  raise_application_error( -20001 , ''Error al generar el documento.'' );',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8070920587000322)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'prc_co_dcmnto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'',
'begin',
'    if(:P59_IMPRSION_TPO = ''ZIP'') then',
'    null;',
'    end if;',
'    ',
'    begin ',
'        apex_json.open_object;',
'        apex_json.open_array(''data''); --  , "data":[',
'        for c_id_dcmntos in (select a.id_dcmnto_gd from re_g_documentos_lote_pago_gd a',
'                              where a.id_dcmnto_lte = :P59_ID_DCMNTO_LTE ) loop',
'            apex_json.open_object;',
'            apex_json.write(''idDocumeto'', c_id_dcmntos.id_dcmnto_gd); ',
'            apex_json.close_object;',
'        end loop;',
'        apex_json.close_all;          --  ]   -- }',
'    exception ',
'        when no_data_found then ',
'            apex_json.open_object;',
'            apex_json.write(''error'', ''Ha ocurrido un error!!!''); ',
'            apex_json.close_object; ',
'        when others then',
'            raise_application_error(-20000, ''Error, no puede superar el limite'');',
'    end;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
