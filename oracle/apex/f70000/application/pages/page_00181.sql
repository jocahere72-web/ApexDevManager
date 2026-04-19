prompt --application/pages/page_00181
begin
wwv_flow_api.create_page(
 p_id=>181
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'181. Declaraciones Digitadas Autorizar'
,p_step_title=>'181. Declaraciones Digitadas Autorizar'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/1.0/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/pdfjs-2.4.456-dist/build/pdf.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'const URLSERVER = ''https://taxation-valledupar.gobiernoit.com/generarPdf'';',
'function generarBlobPDF() {',
'    ',
'    return new Promise(async function (resolve, reject) {',
'        try {',
'               console.log("Prueba generarBlobPDF try");',
'             let data = await apex.server.process("ajax_imprimirDeclaracion", {',
'                pageItems: "#P181_ID_DCLRCION"',
'            });',
'                 ',
'            if (data.o_cdgo_rspsta != 0) {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.o_mnsje_rspsta,',
'                        unsafe: false',
'                    }',
'                ]);',
'            } else {',
'                  console.log("Prueba generarBlobPDF Else");',
'                ',
'                let VALORES_GESTION = JSON.parse(data.valores);',
'                let html = `<div><div class="container-fluid">${data.html}</div></div>`;',
'                html = formularioDeclaracion.reemplazarHtml(html, VALORES_GESTION);',
'                let elm = VALORES_GESTION.find((f) => { return f.TPO === ''R'' });',
'                var htmla = '''';',
'                if (elm) {',
'                      console.log("Prueba generarBlobPDF if elm");',
'                    html = $(`<div>${html}</div>`);',
'                    var alink = $(html).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                    if (alink.length > 0) {',
'                        JSON.parse(elm.VALUE).forEach((elmt, index, arr) => {',
'                            var clone = $(html).clone();',
'                            var it = $(clone).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                            $(it).text(elmt.valor || '''');',
'                            htmla += `${$(clone).html()}${(index === arr.length - 1) ? '''' : ''<div class="salto"></div>''}`;',
'                        });',
'                    } else {',
'                        htmla = $(html).html();',
'                    }',
'                } else {',
'                    htmla = html;',
'                }',
'                let v_blob = await formularioDeclaracion.fecth_async(URLSERVER, { ''html'': htmla, ''header'': '''' });',
'                //console.log(v_blob);',
'                resolve(v_blob);',
'            }',
'        } catch (e) {',
'            reject(e);',
'        }',
'    })',
'}',
'',
'async function visualizarDeclaracion() {',
'    ',
unistr('   /* let data = await apex.server.process("ajax_actualizarNumeroDeclaraci\00F3n", {'),
'            pageItems: "#P181_NMRO_DCLRCION,#P181_ID_DCLRCION"',
'        });*/',
'    ',
'    ',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        let blobPDF = await generarBlobPDF();',
'        let estadoDeclaracion = apex.item("P181_CDGO_DCLRCION_ESTDO").getValue();',
'        if (estadoDeclaracion == "REG") {',
'            let reader = new FileReader();',
'            let blobPDFbase64;',
'            let promise = new Promise(function (resolve, reject) {',
'                reader.readAsDataURL(blobPDF);',
'                reader.onloadend = function () {',
'                    resolve(reader.result);',
'                }',
'            })',
'            blobPDFbase64 = await promise;',
'',
'            let blobMarcaAgua = new Blob(["<html>DOCUMENTO NO VALIDO PARA PRESENTACION</html>"], { type: ''text/html'' });',
'            let MarcaAguaBase64data;',
'            promise = new Promise(function (resolve, reject) {',
'                reader.readAsDataURL(blobMarcaAgua);',
'                reader.onloadend = function () {',
'                    resolve(reader.result);',
'                }',
'            })',
'',
'            MarcaAguaBase64data = await promise;',
'            let data = await apex.server.process("ajax_agregarMarcaAgua", {',
'                f01: blobPDFbase64,',
'                f02: MarcaAguaBase64data/*,',
'                pageItems: "#P181_ID_DCLRCION"*/',
'            });',
'',
'            console.log("Prueba");',
'            console.log(data.o_cdgo_rspsta);',
'            console.log(data.o_mnsje_rspsta);',
'            console.log("Fin Prueba");',
'',
'            /*if (data.o_cdgo_rspsta != 0) {',
'                apex.message.clearErrors();',
'                apex.message.showErrors([',
'                    {',
'                        type: "error",',
'                        location: "page",',
'                        message: data.o_mnsje_rspsta,',
'                        unsafe: false',
'                    }',
'                ]);',
'            } else {',
'                ',
'            }*/',
'        }',
'        let urlPDF = URL.createObjectURL(blobPDF);',
'        // Asynchronous download of PDF',
'        var loadingTask = pdfjsLib.getDocument(urlPDF);',
'        loadingTask.promise.then(function (pdf) {',
'            console.log(''PDF loaded'');',
'',
'            // Fetch the first page',
'            var pageNumber = 1;',
'            pdf.getPage(pageNumber).then(function (page) {',
'                console.log(''Page loaded'');',
'',
'                var scale = 1.5;',
'                var viewport = page.getViewport({ scale: scale });',
'',
'                // Prepare canvas using PDF page dimensions',
'                var canvas = document.getElementById(''visorPDF'');',
'                var context = canvas.getContext(''2d'');',
'                canvas.height = viewport.height;',
'                canvas.width = viewport.width;',
'',
'                // Render PDF page into canvas context',
'                var renderContext = {',
'                    canvasContext: context,',
'                    viewport: viewport',
'                };',
'                var renderTask = page.render(renderContext);',
'                renderTask.promise.then(function () {',
'                    console.log(''Page rendered'');',
'                });',
'            });',
'        }, function (reason) {',
'            // PDF loading error',
'            console.log(reason)',
'        });',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//imprimirDeclaracion()',
'//imprimirDeclaracion();',
'//mostrarAyudaD();',
'visualizarDeclaracion();',
'',
'/*apex.message.hidePageSuccess();',
'if (sessionStorage.getItem("mensajeDeclaracionPresentada")) {',
'    apex.message.showPageSuccess(sessionStorage.getItem("mensajeDeclaracionPresentada"));',
'    sessionStorage.removeItem("mensajeDeclaracionPresentada");',
'}*/'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AHERNANDEZ'
,p_last_upd_yyyymmddhh24miss=>'20201203170334'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(148995790753022061)
,p_plug_name=>unistr('Regi\00F3n Visor')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>8
,p_plug_display_column=>3
,p_plug_display_point=>'BODY'
,p_plug_source=>'<canvas id="visorPDF"></canvas>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(149146853673147461)
,p_plug_name=>'Opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
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
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99186653068157720)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(149146853673147461)
,p_button_name=>'BTN_AUTRZAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Autorizar Declaraci\00F3n')
,p_button_position=>'BELOW_BOX'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from gi_g_declaraciones',
'where id_dclrcion = :P181_ID_DCLRCION',
'and cdgo_dclrcion_estdo = ''REG'';'))
,p_button_condition_type=>'EXISTS'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(99007505942004016)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(149146853673147461)
,p_button_name=>'BTN_RGRSAR_INCIO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103809474707765)
,p_button_image_alt=>'Corregir Digitacion'
,p_button_position=>'BELOW_BOX'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(99007430403004015)
,p_branch_name=>'ir a la pagina 180 BTN_AUTRZAR'
,p_branch_action=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(99186653068157720)
,p_branch_sequence=>10
,p_branch_condition_type=>'EXISTS'
,p_branch_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from gi_g_declaraciones',
'where id_dclrcion = :P181_ID_DCLRCION',
'and cdgo_dclrcion_estdo = ''AUT'';'))
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(99009882100004039)
,p_branch_name=>'ir a la pagina 180 BTN_RGRSAR_INCIO'
,p_branch_action=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(99007505942004016)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99006982572004010)
,p_name=>'P181_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(149146853673147461)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99009159350004032)
,p_name=>'P181_PRSNTA_PGO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(148995790753022061)
,p_prompt=>unistr('\00BFEsta Declaraci\00F3n presenta pago?')
,p_display_as=>'NATIVE_YES_NO'
,p_grid_column=>4
,p_grid_label_column_span=>3
,p_field_template=>wwv_flow_api.id(164103203154707753)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--radioButtonGroup'
,p_attribute_01=>'CUSTOM'
,p_attribute_02=>'S'
,p_attribute_03=>'SI'
,p_attribute_04=>'N'
,p_attribute_05=>'No'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99009389607004034)
,p_name=>'P181_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(149146853673147461)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99009430857004035)
,p_name=>'P181_ID_SUB_IMSPTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(149146853673147461)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99009541393004036)
,p_name=>'P181_VGNCIA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(149146853673147461)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99009618310004037)
,p_name=>'P181_ID_PRDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(149146853673147461)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99009776272004038)
,p_name=>'P181_ID_DCLRCN_TPO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(149146853673147461)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(99187380258157740)
,p_name=>'P181_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(149146853673147461)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(99007031504004011)
,p_computation_sequence=>10
,p_computation_item=>'P181_CDGO_DCLRCION_ESTDO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'FUNCTION_BODY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'    ',
'',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''GET'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(:P181_ID_DCLRCION)));',
'    ',
'    ',
'    return v_json.get_String(''cdgo_dclrcion_estdo'');',
'end;'))
,p_compute_when=>'P181_ID_DCLRCION'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99007265960004013)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Autorizacion_Declaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   ',
'    p_fcha                       timestamp;',
'    p_id_rcdo                    number;',
'    p_id_usrio_aplccion          number;',
'    o_cdgo_rspsta                number;',
'    o_mnsje_rspsta               varchar2(4000);',
'begin',
'    begin',
'        pkg_gi_declaraciones.prc_ac_declaracion_estado(',
'                                                        p_cdgo_clnte                 => :F_CDGO_CLNTE,',
'                                                        p_id_dclrcion                => :P181_ID_DCLRCION,',
'                                                        p_cdgo_dclrcion_estdo        => ''AUT'',',
'                                                        p_fcha                       => sysdate,',
'                                                        p_id_usrio_aplccion          => :F_ID_USRIO,',
'                                                        o_cdgo_rspsta                => o_cdgo_rspsta,',
'                                                        o_mnsje_rspsta               => o_mnsje_rspsta );',
'',
'        if  (o_cdgo_rspsta <> 0) then ',
'        null;',
'        else ',
'            begin',
'                insert into gi_g_dclrcnes_dgtdas (  id_dclrcion',
'                                                   ,id_usrio_dgtdor                                                  ',
'                                                   ,prsnta_pgo )',
'                                           values ( :P181_ID_DCLRCION',
'                                                   ,:F_ID_USRIO',
'                                                   ,:P181_PRSNTA_PGO) ;',
'            end;',
'        end if;',
'    end;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(99186653068157720)
,p_process_success_message=>unistr('La declaraci\00F3n fue autorizada satisfactoriamente.')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99187747863157783)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_imprimirDeclaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'    ',
'',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionReporte'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''gestionarReporteFormulario:'' || :F_CDGO_CLNTE || '':'' || :P181_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''valores'', v_json.get_Clob(''valores''));',
'    apex_json.write(''v_id_dclrcion'', :P3_ID_DCLRCION);',
'    apex_json.write(''v_cdgo_clnte'' , :F_CDGO_CLNTE);',
'    apex_json.write(''html''   , v_json.get_Clob(''html''));',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99007115823004012)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_agregarMarcaAgua'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json                json_object_t;',
'    v_blob_bse_64         clob;',
'    v_blob_mrca_bse_64    clob;',
'begin',
'    /*apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''validarDeclaracionesAdjuntos:'' || :F_CDGO_CLNTE || '':'' || :P3_ID_DCLRCION)));*/',
'    ',
'    for i in 1..apex_application.g_f01.count',
'    loop',
'        v_blob_bse_64 := v_blob_bse_64 || apex_application.g_f01(i);',
'    end loop;',
'    ',
'    for i in 1..apex_application.g_f02.count',
'    loop',
'        v_blob_mrca_bse_64 := v_blob_mrca_bse_64 || apex_application.g_f02(i);',
'    end loop;',
'    ',
'    delete muerto;',
'    insert into muerto (n_001, c_001) values (1, v_blob_bse_64);',
'    insert into muerto (n_001, c_001) values (2, v_blob_mrca_bse_64);',
'    commit;',
'    ',
'    apex_json.open_object;',
'    /*apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));*/',
'    apex_json.write(''o_cdgo_rspsta'', ''0'');',
'    apex_json.write(''o_mnsje_rspsta'', v_blob_mrca_bse_64);',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(99010048336004041)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('ajax_actualizarNumeroDeclaraci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    update gi_g_declaraciones ',
'    set    nmro_cnsctvo = :P181_NMRO_DCLRCION',
'    where  id_dclrcion  = :P181_ID_DCLRCION;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
