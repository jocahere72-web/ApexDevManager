prompt --application/pages/page_00268
begin
wwv_flow_api.create_page(
 p_id=>268
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'visor declaracion'
,p_page_mode=>'MODAL'
,p_step_title=>'VISOR PDF'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/1.0/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function imprimirDeclaracion(descargar) {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        console.log(''Paso: 1  Inicio'');',
'        let data = await apex.server.process("ajax_imprimirDeclaracion", {',
'            pageItems: "#P3_ID_DCLRCION"',
'        });',
'        console.log(apex.item("P3_ID_DCLRCION").getValue());',
'        console.log(''Paso: 2 Despues de apex.server.process'');',
'        console.log("data=>",data);',
'        //console.log(data);',
'        ',
'        if (data.o_cdgo_rspsta != 0) {',
'            console.log(''Paso 3. if (data.o_cdgo_rspsta != 0) '');',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type: "error",',
'                    location: "page",',
'                    message: data.o_mnsje_rspsta,',
'                    unsafe: false',
'                }',
'            ]);',
'        } else {',
'            console.log(''Paso 4. else '');',
'            let VALORES_GESTION = JSON.parse(data.valores);',
'            console.log("VALORES_GESTION:=>",VALORES_GESTION);',
'            console.log(VALORES_GESTION);',
'            let html = `<div><div class="container-fluid">${data.html}</div></div>`;',
'            html = formularioDeclaracion.reemplazarHtml(html, VALORES_GESTION);',
'            let elm = VALORES_GESTION.find((f) => { return f.TPO === ''R'' });',
'            var htmla = '''';',
'            if (elm) {',
'                console.log(''Paso 5. if (elm) '');',
'                html = $(`<div>${html}</div>`);',
'                var alink = $(html).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                if (alink.length > 0) {',
'                    JSON.parse(elm.VALUE).forEach((elmt, index, arr) => {',
'                        var clone = $(html).clone();',
'                        var it = $(clone).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                        $(it).text(elmt.valor || '''');',
'                        htmla += `${$(clone).html()}${(index === arr.length - 1) ? '''' : ''<div class="salto"></div>''}`;',
'                    });',
'                }else{',
'                    htmla =  $(html).html();',
'                }',
'            }else{',
'                console.log(''Paso 9. if (elm) else '');',
'                htmla = html;',
'            }',
'            //console.log(htmla);',
'            var urlServer = ''https://monteria.taxationsmart.co/generarPdf'';',
'            //var urlServer = ''https://taxation-valledupar.gobiernoit.com/generarPdf'';',
'            ',
'            //var urlServer = ''https://valledupar.taxationsmart.co/generarPdf'';',
'            //`${window.location.protocol}//${window.location.hostname}/generarPdf`;',
'            //var urlServer = ''http://192.168.11.34:8000/generarPdf'';',
'',
'            console.log(''Paso 10. Despues de  var urlServer: '' + urlServer);',
'            console.log(htmla);           ',
'            let v_blob = await formularioDeclaracion.fecth_async(urlServer, { ''html'': htmla, ''header'': '''' });',
'            console.log(v_blob);',
'            await visor(v_blob);',
'            ',
'            console.log(''Paso: 1 ''+descargar);',
'',
'            if (descargar){',
'',
'                let a = document.createElement("a");',
'                document.body.appendChild(a);',
'',
'                //var mimetype = v_blob.type.toLowerCase().split('';'')[0];',
'                //d.filename = d.filename + ext[mimetype];',
'                let v_url = window.URL.createObjectURL(v_blob);',
'                a.download = "declaracion.pdf";//d.filename;',
'                a.href = v_url;',
'                a.click();',
'                document.body.removeChild(a);',
'                window.URL.revokeObjectURL(v_url);',
'            }',
'        }',
'        /*apex.server.process("ajax_imprimirDeclaracion", {',
'            pageItems: "#P3_ID_DCLRCION"',
'        }, {',
'            success: async function (data) {',
'                if (data.o_cdgo_rspsta != 0) {',
'                    apex.message.clearErrors();',
'                    apex.message.showErrors([',
'                        {',
'                            type: "error",',
'                            location: "page",',
'                            message: data.o_mnsje_rspsta,',
'                            unsafe: false',
'                        }',
'                    ]);',
'                } else {',
'                    let VALORES_GESTION = JSON.parse(data.valores);',
'                    let html = `<div><div class="container-fluid">${data.html}</div></div>`;',
'                    html = formularioDeclaracion.reemplazarHtml(html, VALORES_GESTION);',
'                    let elm = VALORES_GESTION.find((f) => { return f.TPO === ''R'' });',
'                    var htmla = '''';',
'                    if (elm) {',
'                        html = $(`<div>${html}</div>`);',
'                        var alink = $(html).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                        if (alink.length > 0) {',
'                            JSON.parse(elm.VALUE).forEach((elmt, index, arr) => {',
'                                var clone = $(html).clone();',
'                                var it = $(clone).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                                $(it).text(elmt.valor || '''');',
'                                htmla += `${$(clone).html()}${(index === arr.length - 1) ? '''' : ''<div class="salto"></div>''}`;',
'                            });',
'                        }else{',
'                            htmla =  $(html).html();',
'                        }',
'                    }else{',
'                        htmla = html;',
'                    }',
'                    //console.log(htmla);',
'                    var urlServer = ''https://taxation-valledupar.gobiernoit.com/generarPdf'';//`${window.location.protocol}//${window.location.hostname}/generarPdf`;',
'                    let v_blob = await formularioDeclaracion.fecth_async(urlServer, { ''html'': htmla, ''header'': '''' });',
'                    //console.log(v_blob);',
'                    await visor(v_blob);',
'                    ',
'                    if (descargar){',
'                        ',
'                        let a = document.createElement("a");',
'                        document.body.appendChild(a);',
'                        ',
'                        //var mimetype = v_blob.type.toLowerCase().split('';'')[0];',
'                        //d.filename = d.filename + ext[mimetype];',
'                        let v_url = window.URL.createObjectURL(v_blob);',
'                        a.download = "declaracion.pdf";//d.filename;',
'                        a.href = v_url;',
'                        a.click();',
'                        document.body.removeChild(a);',
'                        window.URL.revokeObjectURL(v_url);',
'                    }',
'                }',
'            }',
'        });*/',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
'function visor(file) {',
'    return new Promise(function(resolve, reject){',
'        var container = document.getElementById(''visor'');',
'        if (container.childElementCount > 0)',
'            container.children[0].remove();',
'        if (file) {',
'            var v_url = window.URL.createObjectURL(file);',
'            var visor = document.createElement(''embed'');',
'            var obj = document.createElement(''object'');',
'            obj.setAttribute(''data'', v_url);',
'            obj.setAttribute(''width'', ''100%'');',
'            obj.setAttribute(''height'', ''100%'');',
'            obj.setAttribute(''type'', file.type);',
'            obj.append(visor);',
'            visor.setAttribute(''class'', ''pdfobject'');',
'            visor.setAttribute(''src'', v_url);',
'            visor.setAttribute(''type'', file.type);',
'            visor.setAttribute(''style'', ''overflow: auto; width: 100%; height: 100%;'');',
'            visor.setAttribute(''internalinstanceid'', ''29'');',
'            container.append(obj);',
'        }',
'        resolve(true)',
'    })',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'imprimirDeclaracion();',
'mostrarAyudaD();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_page_template_options=>'#DEFAULT#'
,p_dialog_width=>'2000'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250627113811'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(72322649876414494)
,p_plug_name=>unistr('Regi\00F3n Visor')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>11
,p_plug_display_column=>1
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="visor" class="pdfobject-container" ></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(8604449074384284)
,p_branch_name=>'ir a la pagina 23'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:P23_CDGO_ORGN_TPO,P23_ID_IMPSTO,P23_ID_SJTO_IMPSTO,P23_ID_ORGEN,P23_ID_IMPSTO_SBMPSTO,P23_FCHA:DL,&P35_ID_IMPSTO.,&P35_ID_SJTO_IMPSTO.,&P35_ID_DCLRCION.,&P35_ID_IMPSTO_SBMPSTO.,&P35_FCHA_PRSNTCION_PRYCTDA.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_COMPUTATION'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8595486247384248)
,p_name=>'P268_ID_DCLRCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(72322649876414494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(8595826532384257)
,p_name=>'P268_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(72322649876414494)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(8600638774384268)
,p_computation_sequence=>10
,p_computation_item=>'P268_CDGO_DCLRCION_ESTDO'
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
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(',
'                                                                     p_url          => ''http://99.0.3.141:8031/ords/api/declaraciones/gestionReporte'',',
'                                                                     --p_url          => ''https://sucre-prueba.taxationsmart.co/ords/api/declaraciones/gestionReporte'',',
'                                                                     p_http_method  => ''GET'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(:P268_ID_DCLRCION)));',
'    ',
'    ',
'    return v_json.get_String(''cdgo_dclrcion_estdo'');',
'end;'))
,p_compute_when=>'P268_ID_DCLRCION'
,p_compute_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8601329572384269)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'P268_CALCULO_ITEMS_PAGO_LINE'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.id_impsto',
'        ,a.id_impsto_sbmpsto',
'        ,a.id_sjto_impsto',
'into    :P268_ID_IMPSTO',
'        ,:P268_ID_IMPSTO_SBMPSTO',
'        ,:P268_ID_SJTO_IMPSTO',
'from    gi_g_declaraciones a',
'where   a.id_dclrcion           =  :P268_ID_DCLRCION;',
'--and     cdgo_dclrcion_estdo     = ''AUT'';'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8601759456384269)
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
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => ''http://99.0.3.141:8031/ords/api/declaraciones/gestionReporte'',--http://192.168.12.42:8069/ords/api/declaraciones/gestionReporte'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''gestionarReporteFormulario:'' || :F_CDGO_CLNTE || '':'' || :P268_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''valores'', v_json.get_Clob(''valores''));',
'    apex_json.write(''v_id_dclrcion'', :P268_ID_DCLRCION);',
'    apex_json.write(''v_cdgo_clnte'' , :F_CDGO_CLNTE);',
'    apex_json.write(''html''   , v_json.get_Clob(''html''));',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(8602175650384269)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_autorizarImpresion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => ''http://99.0.3.141:8031/ords/api/declaraciones/gestionReporte'',--:F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionReporte'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''autorizarImpresionFormulario:'' || :F_CDGO_CLNTE || '':'' || :P268_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
