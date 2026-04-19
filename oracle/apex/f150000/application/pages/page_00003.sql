prompt --application/pages/page_00003
begin
wwv_flow_api.create_page(
 p_id=>3
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Declaraciones Confirmar Presentaci\00F3n')
,p_step_title=>unistr('Declaraciones Confirmar Presentaci\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/1.0/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var urlServer = ''https://monteria.taxationsmart.co/generarPdf'';',
'var v_base64data = "";',
'',
'async function imprimirDeclaracion(descargar) {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        // Llamada al proceso AJAX para verificar la existencia del blob',
'        let blobCheck = await apex.server.process("ajax_existe_blob", {',
'            pageItems: "#P3_ID_DCLRCION"',
'        });',
'',
'        if (blobCheck.exists) {',
'            // Si existe el registro, enviar el request ''declaracion''',
'            apex.page.submit({ request: "declaracion" });',
unistr('            return; // Terminar la ejecuci\00F3n de la funci\00F3n'),
'        }',
'',
unistr('        // Llamada al proceso AJAX para obtener la declaraci\00F3n'),
'',
'        let data = await apex.server.process("ajax_imprimirDeclaracion", {',
'            pageItems: "#P3_ID_DCLRCION"',
'        });',
'',
'        if (data.o_cdgo_rspsta != 0) {',
'            // Mostrar errores si existen',
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
'            // Procesar y mostrar el HTML recibido',
'            let VALORES_GESTION = JSON.parse(data.valores);',
'            let html = `<div><div class="container-fluid">${data.html}</div></div>`;',
'            html = formularioDeclaracion.reemplazarHtml(html, VALORES_GESTION);',
'',
'            let elm = VALORES_GESTION.find((f) => f.TPO === ''R'');',
'            let htmla = '''';',
'',
'            if (elm) {',
'                html = $(`<div>${html}</div>`);',
'                let alink = $(html).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                if (alink.length > 0) {',
'                    JSON.parse(elm.VALUE).forEach((elmt, index, arr) => {',
'                        let clone = $(html).clone();',
'                        let it = $(clone).find(`:regex(data-elm,^${elm.CDGO}$)`);',
'                        $(it).text(elmt.valor || '''');',
'                        htmla += `${$(clone).html()}${(index === arr.length - 1) ? '''' : ''<div class="salto"></div>''}`;',
'                    });',
'                } else {',
'                    htmla = $(html).html();',
'                }',
'            } else {',
'                htmla = html;',
'            }',
'',
'            // Obtener el Blob y convertirlo a base64',
'            let v_blob = await formularioDeclaracion.fecth_async(urlServer, { ''html'': htmla, ''header'': '''' });',
'            v_base64data = await fetchBlobAsBase64(v_blob);',
'',
'            // Mostrar el Blob en el visor PDF',
'            await visor(v_blob);',
'',
'            if (descargar) {',
'                // Descargar el archivo',
'                let a = document.createElement("a");',
'                document.body.appendChild(a);',
'                let v_url = window.URL.createObjectURL(v_blob);',
'                a.download = "declaracion.pdf";',
'                a.href = v_url;',
'                a.click();',
'                document.body.removeChild(a);',
'                window.URL.revokeObjectURL(v_url);',
'            }',
'        }',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
'async function visor(file) {',
'    return new Promise((resolve, reject) => {',
'        let container = document.getElementById(''visor'');',
'        if (container.childElementCount > 0) {',
'            container.children[0].remove();',
'        }',
'',
'        if (file) {',
'            let v_url = window.URL.createObjectURL(file);',
'            let visor = document.createElement(''embed'');',
'            visor.setAttribute(''class'', ''pdfobject'');',
'            visor.setAttribute(''src'', v_url);',
'            visor.setAttribute(''type'', file.type);',
'            visor.setAttribute(''style'', ''overflow: auto; width: 100%; height: 100%;'');',
'            container.append(visor);',
'',
'            resolve(true);',
'        } else {',
'            reject("No hay Archivo");',
'        }',
'    });',
'}',
'',
unistr('// Funci\00F3n para obtener el Blob y convertirlo a base64'),
'async function fetchBlobAsBase64(blob) {',
'    return new Promise((resolve, reject) => {',
'        const reader = new FileReader();',
'        reader.onloadend = () => resolve(reader.result.split('','')[1]);',
'        reader.onerror = reject;',
'        reader.readAsDataURL(blob);',
'    });',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'imprimirDeclaracion();',
'mostrarAyudaD();'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.pdfobject-container {',
'    height: 60rem;',
'    border: 1rem solid rgba(0, 0, 0, .1);',
'}'))
,p_step_template=>wwv_flow_api.id(252164311814651356)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'CNEGRETE'
,p_last_upd_yyyymmddhh24miss=>'20250918142117'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54529352967130128)
,p_plug_name=>'Opciones'
,p_region_name=>'opciones'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
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
 p_id=>wwv_flow_api.id(55154258118709401)
,p_plug_name=>unistr('Regi\00F3n Visor')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>'<div id="visor" class="pdfobject-container" ></div>'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(57734743629698901)
,p_plug_name=>'Ayuda'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<br>',
'<h5>',
'    <b>',
'        <i>',
'            <center>Ayuda <i class="fa fa-question-circle" aria-hidden="true"></i></center>',
'        </i>',
'    </b>',
'</h5>',
unistr('<i style=" color: red; font-weight: 500; font-size: 18px;">Se debe autorizar la declaraci\00F3n con el fin de habilitar la presentaci\00F3n de la misma ante la administraci\00F3n.</i>'),
'<br><br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55278090492158401)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(54529352967130128)
,p_button_name=>'BTN_IMPRIMIR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Autorizar e Imprimir'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'(:P3_CDGO_DCLRCION_ESTDO = ''REG'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-print'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(55154495437709403)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(54529352967130128)
,p_button_name=>'BTN_AUTRZAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Enviar a Autorizar'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'(:P3_CDGO_DCLRCION_ESTDO = ''REG'' and :P3_CDGO_TPO_AUTRZCION = ''AUTC'')'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-envelope-arrow-up'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(30251210156033526)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(54529352967130128)
,p_button_name=>'BTN_AUTRZAR_FRMA'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Firma Electr\00F3nica')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-pencil-square-o'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(32054101456230840)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(54529352967130128)
,p_button_name=>'BTN_PRESENTAR_SIN_PAGO'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>unistr('Presentaci\00F3n Sin Pago')
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P3_CDGO_DCLRCION_ESTDO = ''AUT2'' and exists  (',
'                                                select  1',
'                                                from    gi_g_declaraciones          a',
'                                                join    gi_d_dclrcnes_vgncias_frmlr b   on  b.id_dclrcion_vgncia_frmlrio    =   a.id_dclrcion_vgncia_frmlrio',
'                                                join    gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcion_tpo_vgncia        =   b.id_dclrcion_tpo_vgncia',
'                                                join    gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo                 =   c.id_dclrcn_tpo',
'                                                where   a.id_dclrcion           =   :P3_ID_DCLRCION',
'                                                and     a.vlor_pago             =   0',
'                                                and     d.indcdor_prsntcion_web =   ''S''    ',
'                                            );'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-credit-card-alt'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(10362507827454727)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_api.id(54529352967130128)
,p_button_name=>'BTN_PAGO_PSE'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Presentar y Pagar en Linea'
,p_button_position=>'BELOW_BOX'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P3_CDGO_DCLRCION_ESTDO = ''AUT'' and exists  (',
'                                                select  1',
'                                                from    gi_g_declaraciones          a',
'                                                join    gi_d_dclrcnes_vgncias_frmlr b   on  b.id_dclrcion_vgncia_frmlrio    =   a.id_dclrcion_vgncia_frmlrio',
'                                                join    gi_d_dclrcnes_tpos_vgncias  c   on  c.id_dclrcion_tpo_vgncia        =   b.id_dclrcion_tpo_vgncia',
'                                                join    gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo                 =   c.id_dclrcn_tpo',
'                                                where   a.id_dclrcion           =   :P3_ID_DCLRCION',
'                                                and     a.vlor_pago             >=   0',
'                                                and    pkg_gn_generalidades.fnc_vl_pago_pse(a.cdgo_clnte,a.ID_IMPSTO,a.ID_IMPSTO_SBMPSTO)  = ''S''',
'                                            )',
'/*and not exists (select 1 from re_g_pagadores_documento e ',
'                where e.id_orgen = :P3_ID_DCLRCION ',
'                and e.indcdor_estdo_trnsccion in (''IN'',''PE'',''AP'')--IN: Iniciada, PE: Pendiente, AP: Aprobada',
'               )*/'))
,p_button_condition_type=>'SQL_EXPRESSION'
,p_icon_css_classes=>'fa-credit-card'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78325066662004228)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_api.id(54529352967130128)
,p_button_name=>'BTN_ADJNTAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Adjuntar Archivos'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.:RP:P25_ID_DCLRCION:&P3_ID_DCLRCION.'
,p_button_condition=>'( :P3_INDCDOR_ADJNTOS = ''S'' and :P3_CDGO_DCLRCION_ESTDO in (''REG'', ''AUT'', ''RLA''))'
,p_button_condition_type=>'PLSQL_EXPRESSION'
,p_icon_css_classes=>'fa-file-arrow-up'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57735125138698905)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_api.id(54529352967130128)
,p_button_name=>'BTN_RGRSAR_INCIO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--stretch'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar al Inicio'
,p_button_position=>'BELOW_BOX'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1::'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(10362657939454728)
,p_branch_name=>'ir a la pagina 23'
,p_branch_action=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:RP,23:P23_CDGO_ORGN_TPO,P23_ID_IMPSTO,P23_ID_SJTO_IMPSTO,P23_ID_ORGEN,P23_ID_IMPSTO_SBMPSTO:DL,&P3_ID_IMPSTO.,&P3_ID_SJTO_IMPSTO.,&P3_ID_DCLRCION.,&P3_ID_IMPSTO_SBMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(10362507827454727)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(30253465180033548)
,p_branch_name=>'ir a la pagina 550'
,p_branch_action=>'f?p=&APP_ID.:550:&SESSION.::&DEBUG.:RP:P550_COLUMNA_FILENAME,P550_COLUMNA_BLOB,P550_COLUMNA_MIME,P550_NOMBRE_TABLA,P550_VALOR,P550_COLUMNA_CLAVE_PRIMARIA,P550_ID_DCLRCION,P550_INDCDOR_ADJNTOS,P550_ID_IMPSTO,P550_ID_IMPSTO_SBMPSTO,P550_ID_SJTO_IMPSTO:file_name,file_blob,file_mimetype,gi_g_dclrcnes_arhvos_adjnto,&P3_ID_DCLRCION.,id_dclrcion,&P3_ID_DCLRCION.,&P3_INDCDOR_ADJNTOS.,&P3_ID_IMPSTO.,&P3_ID_IMPSTO_SBMPSTO.,&P3_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'declaracion'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31679830591798604)
,p_name=>'P3_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(54529352967130128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(31680228767798608)
,p_name=>'P3_CDGO_TPO_AUTRZCION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_api.id(54529352967130128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32043262379105769)
,p_name=>'P3_ID_IMPSTO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(54529352967130128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32043632917105769)
,p_name=>'P3_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(54529352967130128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(32044021284105769)
,p_name=>'P3_ID_SJTO_IMPSTO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(54529352967130128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54529493016130129)
,p_name=>'P3_ID_DCLRCION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(54529352967130128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55278264194158403)
,p_name=>'P3_CDGO_DCLRCION_ESTDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(54529352967130128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(79686470905354340)
,p_name=>'P3_INDCDOR_ADJNTOS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(54529352967130128)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57734851370698902)
,p_name=>unistr('Autorizar Declaraci\00F3n')
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(55278090492158401)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57734980313698903)
,p_event_id=>wwv_flow_api.id(57734851370698902)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function autorizarImpresion() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        apex.server.process("ajax_autorizarImpresion", {',
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
'                    await imprimirDeclaracion(true);',
'                    apex.submit();',
'                }',
'            }',
'        });',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de autorizar la impresi\00F3n de la declaraci\00F3n?", function( okPressed ) {'),
'    if( okPressed ) {',
'        autorizarImpresion()',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(30251356635033527)
,p_name=>'Autorizar Firma'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(30251210156033526)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(30251429012033528)
,p_event_id=>wwv_flow_api.id(30251356635033527)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function actualizarYAutorizar() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        // Actualizar Firma',
'        let dataActualizar = await apex.server.process("ajax_actualizarFirma", {',
'            pageItems: "#P3_ID_DCLRCION"',
'        });',
'',
'        if (dataActualizar.o_cdgo_rspsta != 0) {',
'            apex.message.clearErrors();',
'            apex.message.showErrors([',
'                {',
'                    type: "error",',
'                    location: "page",',
'                    message: dataActualizar.o_mnsje_rspsta,',
'                    unsafe: false',
'                }',
'            ]);',
'            return; // Terminar si hay error en actualizarFirma',
'        } else {',
'            await imprimirDeclaracion();',
'        }',
'',
'        // Autorizar Firma',
unistr('        await new Promise(resolve => setTimeout(resolve, 100)); // Esperar un momento para asegurar la actualizaci\00F3n de v_base64data'),
'        apex.server.process(',
'            "ajax_autorizarFirma", ',
'            {',
'                pageItems: "#P3_ID_DCLRCION, #P3_ID_SJTO_IMPSTO, #P3_ID_IMPSTO, #P3_ID_SUB_IMPSTO",',
'                f01: v_base64data',
'            }, ',
'            {',
'                success: async function (dataAutorizar) {',
'                    if (dataAutorizar.o_cdgo_rspsta != 0) {',
'                        apex.message.clearErrors();',
'                        apex.message.showErrors([',
'                            {',
'                                type: "error",',
'                                location: "page",',
'                                message: dataAutorizar.o_mnsje_rspsta,',
'                                unsafe: false',
'                            }',
'                        ]);',
'                    } else {',
'                        await imprimirDeclaracion();',
'                        apex.submit();',
'                      //  apex.page.submit({ request: "prueba" });',
'                    }',
'                },',
'                error: function(jqXHR, textStatus, errorThrown) {',
'                    console.log(errorThrown);',
'                }',
'            }',
'        );',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
unistr('apex.message.confirm("Presione el bot\00F3n ACEPTAR para enviar el enlace de la firma electr\00F3nica al correo del Representante legal , Contador y/o Revisor fiscal. Una vez los dos responsables hayan firmado, el formulario se actualizar\00E1 autom\00E1ticamente pa')
||'ra que pueda proceder con el pago.", function(okPressed) {',
'    if (okPressed) {',
'        actualizarYAutorizar();',
'    }',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32054317606233878)
,p_name=>unistr('Presentar Declaraci\00F3n')
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(32054101456230840)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32054769612233880)
,p_event_id=>wwv_flow_api.id(32054317606233878)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function presentarDeclaracion() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        apex.server.process("ajax_presentarDeclaracion", {',
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
unistr('                    sessionStorage.setItem("mensajeDeclaracionPresentada", "Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        });',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
unistr('apex.message.confirm( "Tenga en cuenta que la presentaci\00F3n y aplicaci\00F3n se har\00E1 de forma autom\00E1tica \00BFEst\00E1 seguro de presentar la declaraci\00F3n?", function( okPressed ) {'),
'    if( okPressed ) {',
'        presentarDeclaracion();',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32074671434647298)
,p_name=>unistr('Enviar Autorizaci\00F3n')
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(55154495437709403)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32075057103647312)
,p_event_id=>wwv_flow_api.id(32074671434647298)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function enviarAutorizacion() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        apex.server.process("ajax_enviarAutorizacion", {',
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
unistr('                    sessionStorage.setItem("mensajeDeclaracionPresentada", "Acci\00F3n procesada con \00E9xito.");'),
'                    apex.submit();',
'                }',
'            }',
'        });',
'    } catch (e) {',
'        console.log(e);',
'    } finally {',
'        $waitPopup.remove();',
'    }',
'}',
'',
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de continuar con este proceso?", function( okPressed ) {'),
'    if( okPressed ) {',
'        enviarAutorizacion();',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(32174912691784255)
,p_name=>'Pago en Linea'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(10362507827454727)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(32175354922784269)
,p_event_id=>wwv_flow_api.id(32174912691784255)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "Tenga en cuenta que ser\00E1 redireccionado a una p\00E1gina para su pago en l\00EDnea, la presentaci\00F3n y aplicaci\00F3n se har\00E1 de forma autom\00E1tica \00BFEst\00E1 seguro de presentar la declaraci\00F3n?", function(  Aceptar  ) {'),
'    if(  Aceptar  ) {',
'     apex.page.submit( "BTN_PAGO_PSE" );     ',
'    }',
'});'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(3063451864728516)
,p_name=>'Actualizar Opciones'
,p_event_sequence=>80
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_api.id(54529352967130128)
,p_bind_type=>'bind'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(3063566217728517)
,p_event_id=>wwv_flow_api.id(3063451864728516)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30251023295033524)
,p_process_sequence=>10
,p_process_point=>'AFTER_FOOTER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Cargar documento2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    declare',
'    v_dcmento clob;',
'    begin',
unistr('    -- Obtener el valor del \00EDtem P3_DCMENTO'),
'    v_dcmento := :P3_DCMENTO2;',
'',
unistr('    -- Crear o truncar la colecci\00F3n ''dcmento'''),
'    APEX_COLLECTION.CREATE_OR_TRUNCATE_COLLECTION(p_collection_name => ''documento'');',
'',
unistr('    -- Agregar el valor del \00EDtem a la colecci\00F3n'),
'    APEX_COLLECTION.ADD_MEMBER(',
'        p_collection_name => ''documento'',',
'        p_clob001 => :P3_DCMENTO2',
'    );',
'    end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(31711925493255819)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Consultar Datos de la Declaraci\00F3n')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''GET'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(:P3_ID_DCLRCION)));',
'    ',
'    ',
'    :P3_CDGO_DCLRCION_ESTDO         := v_json.get_String(''cdgo_dclrcion_estdo'');',
'    :P3_INDCDOR_ADJNTOS             := v_json.get_String(''indcdor_adjntos'');',
'    :P3_ID_DCLRCION_VGNCIA_FRMLRIO  := v_json.get_String(''id_dclrcion_vgncia_frmlrio'');',
'    :P3_CDGO_TPO_AUTRZCION          := v_json.get_String(''cdgo_tpo_autrzcion'');',
'    :P3_ID_SJTO_IMPSTO              := v_json.get_String(''id_sjto_impsto'');',
'    :P3_ID_IMPSTO                   := v_json.get_String(''id_impsto'');',
'    :P3_ID_IMPSTO_SBMPSTO           := v_json.get_String(''id_impsto_sbmpsto'');',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P3_ID_DCLRCION'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(55154348870709402)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_imprimirDeclaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionReporte'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''gestionarReporteFormulario:'' || :F_CDGO_CLNTE || '':'' || :P3_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''valores'', v_json.get_Clob(''valores''));',
'    apex_json.write(''v_id_dclrcion'', :P3_ID_DCLRCION);',
'    apex_json.write(''v_cdgo_clnte'' , :F_CDGO_CLNTE);',
'    apex_json.write(''html''   , v_json.get_Clob(''html''));',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(57772024156799701)
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
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionReporte'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''autorizarImpresionFormulario:'' || :F_CDGO_CLNTE || '':'' || :P3_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32075766141652982)
,p_process_sequence=>30
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_enviarAutorizacion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''enviarAutorizacionDeclaracion:'' || :F_CDGO_CLNTE || '':'' || :P3_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32080951861782199)
,p_process_sequence=>40
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_presentarDeclaracion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'    v_id_usrio number := :F_ID_USRIO;',
'    v_id_usrio_use number;',
'begin',
'    ',
'    select id_usrio_rgstro',
'    into v_id_usrio',
'    from gi_g_declaraciones',
'    where id_dclrcion = :P3_ID_DCLRCION;',
'    ',
'    if :F_ID_USRIO is null then',
'        v_id_usrio_use := v_id_usrio;',
'    else',
'        v_id_usrio_use := :F_ID_USRIO;',
'    end if;',
'',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion:p_id_usrio''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''presentarDeclaracion:'' || :F_CDGO_CLNTE || '':'' || :P3_ID_DCLRCION || '':'' || v_id_usrio_use)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(32081218859782776)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarAdjuntos'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''validarDeclaracionesAdjuntos:'' || :F_CDGO_CLNTE || '':'' || :P3_ID_DCLRCION)));',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'', v_json.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30249057859033504)
,p_process_sequence=>60
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_autorizarFirma'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json          clob;',
'    v_json_object   json_object_t;',
'    v_file_base64   clob;',
'    v_body          clob;',
'',
'begin',
'',
'    for i in 1 .. apex_application.g_f01.count',
'    loop',
'        v_file_base64 := v_file_base64 || apex_application.g_f01(i);',
'    end loop;',
'          ',
'    v_body := ''{',
' "p_accion" : "autorizarfirmaformulario",',
' "p_cdgo_clnte" : '' 	|| :F_CDGO_CLNTE || '',',
' "p_id_impsto" : '' 		|| :P3_ID_IMPSTO || '',',
' "p_id_sub_impsto" : '' 	|| :P3_ID_IMPSTO_SBMPSTO || '',',
' "p_id_sjto_impsto" : ''	|| :P3_ID_SJTO_IMPSTO || '',',
' "p_id_dclrcion" : '' 	|| :P3_ID_DCLRCION || '',',
' "p_dcmento" : "'' 		|| v_file_base64 || ''"',
'}'';',
'    ',
'',
'    -- Limpiar header',
'    apex_web_service.g_request_headers.delete();',
'    -- Adicionamos Header',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'        ',
'    v_json := apex_web_service.make_rest_request(',
'                    p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionFirma'',',
'                    p_http_method  => ''POST'',',
'                    p_body		    => v_body',
'                );',
'    ',
'    v_json_object := json_object_t.parse( v_json );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'',  v_json_object.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json_object.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'',
'',
'	exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
'													''<summary>'' || ''No fue posible ejecutar el proceso, '' ||',
'													''por favor intente nuevamente.</summary>'' ||',
'													''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'											  ''</details>'' || sqlerrm);',
'            apex_json.close_object;',
'	',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Proceso ejecutado'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30251175042033525)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_actualizarFirma'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json          clob;',
'    v_json_object   json_object_t;',
'    v_body          clob;',
'',
'begin    ',
'',
'          ',
'    v_body := ''{',
' "p_accion" : "actualizarimpresionfirma",',
' "p_cdgo_clnte" : '' 	|| :F_CDGO_CLNTE || '',',
' "p_id_dclrcion" : '' 	|| :P3_ID_DCLRCION || ''',
'}'';',
'    ',
'',
'    -- Limpiar header',
'    apex_web_service.g_request_headers.delete();',
'    -- Adicionamos Header',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'        ',
'    v_json := apex_web_service.make_rest_request(',
'                    p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionFirma'',',
'                    p_http_method  => ''POST'',',
'                    p_body		    => v_body',
'                );',
'    ',
'',
'    v_json_object := json_object_t.parse( v_json );',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''o_cdgo_rspsta'',  v_json_object.get_Number(''o_cdgo_rspsta''));',
'    apex_json.write(''o_mnsje_rspsta'', v_json_object.get_String(''o_mnsje_rspsta''));',
'    apex_json.close_object;',
'	exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', 100);',
'            apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
'													''<summary>'' || ''No fue posible ejecutar el proceso, '' ||',
'													''por favor intente nuevamente.</summary>'' ||',
'													''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'											  ''</details>'' || sqlerrm);',
'            apex_json.close_object;',
'	',
'end;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(30253124793033545)
,p_process_sequence=>80
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_existe_blob'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_count number;',
'begin',
'    select count(*)',
'    into v_count',
'    from gi_g_dclrcnes_arhvos_adjnto',
'    where id_dclrcion = :P3_ID_DCLRCION;',
'',
'    if v_count > 0 then',
'        htp.p(''{"exists": true}'');',
'',
'    else',
'        htp.p(''{"exists": false}'');',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
