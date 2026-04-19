prompt --application/pages/page_00118
begin
wwv_flow_api.create_page(
 p_id=>118
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>unistr('Declaraciones Confirmar Declaraci\00F3n')
,p_step_title=>unistr('Declaraciones Confirmar Declaraci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/1.0/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'//const URLSERVER = ''https://taxation-corozal.gobiernoit.com/generarPdf'';',
'//const URLSERVER = ''https://taxation-soledad.gobiernoit.com/generarPdf'';',
'//const URLSERVER = ''https://taxation-monteria.gobiernoit.com/generarPdf'';',
'const URLSERVER = ''https://since.taxationsmart.co/generarPdf'';',
'',
'async function imprimirDeclaracion() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        let data = await apex.server.process("ajax_imprimirDeclaracion", {',
'            pageItems: "#P118_ID_DCLRCION"',
'        });',
'        ',
'        if (data.o_cdgo_rspsta != 0) {',
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
'            let VALORES_GESTION = JSON.parse(data.valores);',
'            let html = `<div><div class="container-fluid">${data.html}</div></div>`;',
'            html = formularioDeclaracion.reemplazarHtml(html, VALORES_GESTION);',
'            let elm = VALORES_GESTION.find((f) => { return f.TPO === ''R'' });',
'            var htmla = '''';',
'            if (elm) {',
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
'                htmla = html;',
'            }',
'            //console.log(htmla);',
'            var urlServer = URLSERVER;',
'            let v_blob = await formularioDeclaracion.fecth_async(urlServer, { ''html'': htmla, ''header'': '''' });',
'            //console.log(v_blob);',
'            await visor(v_blob);',
'',
'           /*if (descargar){',
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
'            }*/',
'        }',
'        /*apex.server.process("ajax_imprimirDeclaracion", {',
'            pageItems: "#P118_ID_DCLRCION"',
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
'}',
''))
,p_javascript_code_onload=>'imprimirDeclaracion()'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_step_template=>wwv_flow_api.id(164066127703707633)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20231019154834'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49809763373864401)
,p_plug_name=>unistr('Regi\00F3n Visor')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(164080910676707690)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="visor" class="pdfobject-container" ></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(49960826293989801)
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
 p_id=>wwv_flow_api.id(49960903852989802)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(49960826293989801)
,p_button_name=>'BTN_AUTRZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(164103654258707764)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Autorizar y Presentar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(49809884675864402)
,p_name=>'P118_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(49809763373864401)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141229061988611202)
,p_name=>unistr('Al hacer clic en el bot\00F3n Autorizar')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(49960903852989802)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141229140737611203)
,p_event_id=>wwv_flow_api.id(141229061988611202)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    UPDATE GI_G_DECLARACIONES SET CDGO_DCLRCION_ESTDO = ''AUT'' WHERE ID_DCLRCION = :P118_ID_DCLRCION;',
'    COMMIT;',
'end;'))
,p_attribute_02=>'P118_ID_DCLRCION'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(141964031683219401)
,p_name=>'New'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(49960903852989802)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(141964151840219402)
,p_event_id=>wwv_flow_api.id(141964031683219401)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(49896016048424201)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_imprimirDeclaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_valor_gestion_a   json_array_t;',
'    v_valor_gestion     clob;',
'    v_html              clob;',
'    v_cdgo_rspsta       number;',
'    v_mnsje_rspsta      varchar2(4000);',
'',
'begin',
'    pkg_gi_declaraciones.prc_co_dclrcnes_vlor_gstion(p_cdgo_clnte		=>	:F_CDGO_CLNTE,',
'                                                     p_id_dclrcion		=>	:P118_ID_DCLRCION,',
'                                                     o_valor_gestion    =>	v_valor_gestion_a,',
'                                                     o_cdgo_rspsta		=>	v_cdgo_rspsta,',
'                                                     o_mnsje_rspsta	    =>	v_mnsje_rspsta);',
'',
'    if (v_cdgo_rspsta <> 0) then',
'        null;',
'    end if;',
'',
'    begin',
'        select a.encbzdo || a.cntndo|| a.pie_pgna ',
'          into v_html',
'          from gi_d_declaraciones_reporte a          ',
'          join gi_d_dclrcnes_vgncias_frmlr d on d.id_frmlrio = a.id_frmlrio',
'          join gi_g_declaraciones b on b.id_dclrcion_vgncia_frmlrio = d.id_dclrcion_vgncia_frmlrio',
'          --join gi_g_declaraciones b on b.id_dclrcion_vgncia_frmlrio = a.id_dclrcion_vgncia_frmlrio',
'         where b.id_dclrcion = :P118_ID_DCLRCION',
'           and a.actvo = ''S'';',
'    exception',
'        when others then',
'            v_html := '''';',
'    end;',
'    ',
'    v_valor_gestion := v_valor_gestion_a.stringify;  ',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''valores''         , v_valor_gestion);',
'    apex_json.write(''v_id_dclrcion''   , :P118_ID_DCLRCION);',
'    apex_json.write(''v_cdgo_clnte''    , :F_CDGO_CLNTE);',
'    apex_json.write(''html''            , v_html);',
'    apex_json.write(''o_cdgo_rspsta''   , v_cdgo_rspsta);',
'    apex_json.write(''o_mnsje_rspsta''  , v_mnsje_rspsta);',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
