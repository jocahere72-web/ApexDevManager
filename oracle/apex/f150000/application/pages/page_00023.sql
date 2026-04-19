prompt --application/pages/page_00023
begin
wwv_flow_api.create_page(
 p_id=>23
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Informaci\00F3n del pagador')
,p_step_title=>unistr('Informaci\00F3n del pagador')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js?v=&APP_SESSION.',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js?v=1.1.13',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js?v=&APP_SESSION.',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/consumirServiciosRest.js?v=2223'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function pagarEnLinea(){',
'    ',
'    var response = await pagosEnLinea.iniciarPagoEnLinea();',
'    ',
'    if (response.cdgo_rspsta === 0 ) {',
'',
'       //apex.navigation.openInNewWindow(response.location, "Pago PSE");',
'        ',
'       //window.open(response.location, "_blank");',
'       window.location.assign(response.location);',
'        ',
'       apex.item(''P23_ID_ORGEN'').setValue(response.id_orgen);',
'',
'       //Disopara un branch',
unistr('        // Se deshabilita ejecuci\00F3n de Branch debido a que PlaceToPay retorna a la URL de comercio.'),
'       //$(''#BTN_REDIRECCIONAR'').click();',
'        ',
'        //Devolvemos al pagador al inicio del portal',
'        //window.close();',
'        //$(''#BTN_RGRESAR'').click();',
'',
'    } else {',
'        ',
'        //console.log(response.cdgo_rspsta + '' '' + response.mnsje_rspsta);',
'        ',
unistr('        apex.message.alert( "No se pudo iniciar la transacci\00F3n, intente m\00E1s tarde."+" - Error: "+response.mnsje_rspsta);'),
'    }',
'    ',
'};',
'',
'function cargarModal(){',
'      try {',
'        var emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;',
unistr('        var nameRegex = /^[a-zA-Z\00E1\00E9\00ED\00F3\00FA\00C1\00C9\00CD\00D3\00DA\00FC\00DC\00F1\00D1\005Cs]+$/;'),
'',
'        if ($v(''P23_PRMER_NMBRE'') == '''' || $v(''P23_PRMER_APLLDO'') == '''' || $v(''P23_TLFNO_1'') == '''' || $v(''P23_DRCCION_1'') == '''' || $v(''P23_EMAIL'') == '''' || $v(''P23_IDNTFCCION'') == '''' || $v(''P23_CDGO_IDNTFCCION_TPO'') == '''') {',
'            apex.message.alert("Llene todos los campos obligatorios [*] del formulario.");',
'        } else if (isNaN($v(''P23_TLFNO_1''))) {',
unistr('            apex.message.alert("El campo tel\00E9fono solo puede contener n\00FAmeros.");'),
'        } else if (isNaN($v(''P23_IDNTFCCION''))) {',
unistr('            apex.message.alert("El campo identificaci\00F3n solo puede contener n\00FAmeros");'),
'        } else if (!nameRegex.test($v(''P23_PRMER_NMBRE''))) {',
'            apex.message.alert("El campo Primer Nombre solo puede contener letras y espacios en blanco.");',
'        } else if (!nameRegex.test($v(''P23_PRMER_APLLDO''))) {',
'            apex.message.alert("El campo Primer Apellido solo puede contener letras y espacios en blanco.");',
'        } else if ($v(''P23_SGNDO_NMBRE'') !== '''' && !nameRegex.test($v(''P23_SGNDO_NMBRE''))) {',
'            apex.message.alert("El campo Segundo Nombre solo puede contener letras y espacios en blanco.");',
'        } else if ($v(''P23_SGNDO_APLLDO'') !== '''' && !nameRegex.test($v(''P23_SGNDO_APLLDO''))) {',
'            apex.message.alert("El campo Segundo Apellido solo puede contener letras y espacios en blanco.");',
'        } else if (!emailRegex.test($v(''P23_EMAIL''))) {',
unistr('            apex.message.alert("Por favor, introduce una direcci\00F3n de correo electr\00F3nico v\00E1lida.");'),
'        } else if  (apex.item("P23_TPO_PRSNA").id == ''P23_TPO_PRSNA'' &&  apex.item("P23_TPO_PRSNA").getValue() == '''' &&  apex.item("P23_CDGO_TPO_OPRCION").getValue() == ''MLTCDT'' ) { //Req0026255',
'            apex.message.alert( "Por favor, seleccione el tipo de persona.");  ',
'        } else if  (apex.item("P23_CDGO_BNCO").id == ''P23_CDGO_BNCO'' &&  apex.item("P23_CDGO_BNCO").getValue() == '''' &&  apex.item("P23_CDGO_TPO_OPRCION").getValue() == ''MLTCDT'' ) { //Req0026255',
'            apex.message.alert( "Por favor, seleccione una entidad bancaria.");  ',
'        } else {',
'            apex.server.process("ActualizarDatosPagador", {',
'                pageItems: ''#P23_CDGO_CLNTE,#P23_ID_TRCRO,#P23_PRMER_NMBRE,#P23_SGNDO_NMBRE,#P23_PRMER_APLLDO,#P23_SGNDO_APLLDO,#P23_TLFNO_1,#P23_DRCCION_1,#P23_EMAIL''',
'            }, {',
'                success: function(data) {',
'                    console.log(data.o_cdgo_rspsta);',
'                    if (data.o_cdgo_rspsta > 0) {',
'                        apex.message.clearErrors();',
'                        apex.message.alert(data.o_mnsje_rspsta);',
'                    } else {',
'                        //console.log(data.o_trnccnes_pndntes);',
'                        if (data.o_trnccnes_pndntes > 0) {',
'                            var dtlle_pgos_pndntes = JSON.parse(data.o_dtlle_pgos_pndntes);',
'                            var table_html = ''<h4>Usted tiene '' + data.o_trnccnes_pndntes + '' pago(s) en estado PENDIENTE.''',
'                            table_html += ''<br>'';',
'                            table_html += ''<table class="a-IRR-table">'';',
'                            table_html += ''<thead>'';',
'                            table_html += ''<tr>'';',
'                            table_html += ''<th class="a-IRR-header"><a class="a-IRR-headerLink">Impuesto</a></th>'';',
'                            table_html += ''<th class="a-IRR-header"><a class="a-IRR-headerLink">Referencia</a></th>'';',
'                            table_html += ''<th class="a-IRR-header"><a class="a-IRR-headerLink">Valor</a></th>'';',
'                            table_html += ''<th class="a-IRR-header"><a class="a-IRR-headerLink">Fecha Registro</a></th>'';',
'                            table_html += ''</tr>'';',
'                            table_html += ''</thead>'';',
'                            table_html += ''<tbody>'';',
'',
'                            for (var key in dtlle_pgos_pndntes) {',
'                                if (dtlle_pgos_pndntes.hasOwnProperty(key)) {',
'                                    table_html += ''<tr>'';',
'                                    table_html += ''<td class=" u-tL">'' + dtlle_pgos_pndntes[key].nmbre_impsto_sbmpsto + ''</td>'';',
'                                    table_html += ''<td class=" u-tL">'' + dtlle_pgos_pndntes[key].nmro_dcmnto + ''</td>'';',
'                                    table_html += ''<td class=" u-tL">'' + dtlle_pgos_pndntes[key].vlor_ttal_dcmnto + ''</td>'';',
'                                    table_html += ''<td class=" u-tC">'' + dtlle_pgos_pndntes[key].fcha_rgstro + ''</td>'';',
'                                    table_html += ''</tr>'';',
'                                }',
'                            }',
'',
'                            table_html += ''</tbody>'';',
'                            table_html += ''</table>'';',
'',
'                            Swal.fire({',
'                                icon: ''error'',',
unistr('                                title: ''<H2 >Validaci\00F3n</H2>'','),
'                                html: table_html,',
'                                showCancelButton: true,',
'                                cancelButtonColor: ''#d33'',',
'                                confirmButtonText: ''Deseo continuar'',',
'                                cancelButtonText: ''No deseo continuar''',
'                            }).then((result) => {',
'                                if (result.value) {',
'                                    pagarEnLinea();',
'                                }',
'                            });',
'                            return;',
'',
'                        }',
'                        pagarEnLinea();',
'                    }',
'                }',
'            });',
'        }',
'',
'',
'    } catch (e) {',
'        console.log(e);',
'    }  ',
'};'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) { ',
'    jsonConfig = await cargarConfig();',
'});'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.alert {',
'    position: relative;',
'    padding: .75rem 1.25rem;',
'    margin-bottom: 1rem;',
'    border: 1px solid transparent;',
'    border-radius: .25rem;',
'}',
'',
'.alert-info {',
'    color: #0c5460;',
'    background-color: #d1ecf1;',
'    border-color: #bee5eb;',
'}',
'',
'/*.bloquear{',
'    width: 100%;',
'    height: 100%;',
'    background: rgba(0,0,0,0.6);',
'    position:fixed;',
'    z-index: 1000;',
'}*/',
'',
'#btn_pagos_pendientes{',
'    display: none;',
'}',
'',
'.swal2-popup{',
'    width: auto;',
'}'))
,p_step_template=>wwv_flow_api.id(252165693921651362)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20251112094817'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78094512312206214)
,p_plug_name=>'Datos del pagador'
,p_region_name=>'DATOS_PAGADOR'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="alert alert-info" role="alert">',
unistr('    Ingresar n\00FAmero de identificaci\00F3n. Si no se encuentra registrado en nuestro sistema, por favor complete los campos para realizar un registro previo al pago.'),
unistr('    <p><br>Lo invitamos a leer nuestras pol\00EDticas de protecci\00F3n, seguridad y privacidad de la informaci\00F3n</p>'),
'          <ul>',
unistr('            <li><a href="https://www.monteria.gov.co/publicaciones/1/politicas-de-privacidad-y-condiciones-de-uso/" target="_blank">Pol\00EDticas de privacidad y condiciones de uso</a> </li>'),
unistr('            <li><a href="https://www.monteria.gov.co/publicaciones/2/ley-de-proteccion-de-datos/" target="_blank">Ley de protecci\00F3n de datos</a> </li>'),
unistr('            <li><a href="https://www.monteria.gov.co/publicaciones/2573/plan-de-seguridad-y-privacidad-de-la-informacion/" target="_blank">Plan De Seguridad Y Privacidad De La Informaci\00F3n</a> </li>'),
unistr('            <li><a href="https://www.monteria.gov.co/publicaciones/2572/plan-tratamiento-de-riesgos-de-seguridad-y-privacidad-de-la-informacion/" target="_blank">Plan Tratamiento De Riesgos De Seguridad Y Privacidad De La Informaci\00F3n</a> </li>'),
'          </ul>',
'</div>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78094887921206217)
,p_plug_name=>'Botones'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252173689295651394)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5115355134571237)
,p_button_sequence=>300
,p_button_plug_id=>wwv_flow_api.id(78094887921206217)
,p_button_name=>'btn_pagos_pendientes'
,p_button_static_id=>'btn_pagos_pendientes'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Btn Pagos Pendientes'
,p_button_position=>'BELOW_BOX'
,p_button_execute_validations=>'N'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(89733933391824218)
,p_button_sequence=>270
,p_button_plug_id=>wwv_flow_api.id(78094512312206214)
,p_button_name=>'BTN_REDIRECCIONAR_PAG_28'
,p_button_static_id=>'BTN_REDIRECCIONAR'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Btn Redireccionar Pag 30'
,p_button_position=>'BODY'
,p_button_cattributes=>'style="display:none;"'
,p_grid_new_grid=>false
,p_grid_new_row=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(9672394840265713)
,p_button_sequence=>280
,p_button_plug_id=>wwv_flow_api.id(78094887921206217)
,p_button_name=>'BTN_RGRESAR'
,p_button_static_id=>'BTN_RGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP:F_CDGO_CLNTE:&F_CDGO_CLNTE.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5115177278571235)
,p_button_sequence=>290
,p_button_plug_id=>wwv_flow_api.id(78094887921206217)
,p_button_name=>'BTN_PRGNTAS_FRCNTES'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_image_alt=>'Preguntas frecuentes'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:RP,34:P34_CDGO_ORGN_TPO,P34_ID_IMPSTO,P34_ID_IMPSTO_SBMPSTO:&P23_CDGO_ORGN_TPO.,&P23_ID_IMPSTO.,&P23_ID_IMPSTO_SBMPSTO.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78097658361206245)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(78094887921206217)
,p_button_name=>'btn_crear_tercero_pagador'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Registrar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition=>'P23_ID_TRCRO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(78094918408206218)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(78094887921206217)
,p_button_name=>'Boton_pagar_en_linea'
,p_button_static_id=>'btn_pagar_en_linea'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pago PSE'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P23_ID_TRCRO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-credit-card'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(89734223655824221)
,p_branch_name=>'Go To Page 30'
,p_branch_action=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:RP,30:P30_ID_IMPSTO,P30_ID_IMPSTO_SBMPSTO,P30_ID_ORGEN,P30_CDGO_ORGN_TPO,P30_ID_PGDOR:&P23_ID_IMPSTO.,&P23_ID_IMPSTO_SBMPSTO.,&P23_ID_ORGEN.,&P23_CDGO_ORGN_TPO.,&P23_ID_TRCRO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(89733933391824218)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5115211269571236)
,p_branch_name=>'Ir a pagina 32'
,p_branch_action=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP:P32_ID_PGDOR,P32_CDGO_CLNTE,P32_FCHA,P32_CDGO_ORGN_TPO,P32_ID_IMPSTO,P32_VLOR_TTAL_DAB,P32_CDGO_RCBO_TPO:&P23_ID_TRCRO.,&P23_CDGO_CLNTE.,&P23_FCHA.,&P23_CDGO_ORGN_TPO.,&P23_ID_IMPSTO.,&P23_VLOR_TTAL_DAB.,&P23_CDGO_RCBO_TPO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(5115355134571237)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7408182502678904)
,p_name=>'P23_CDGO_BNCO'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>'Seleccione un Banco:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_bnco, cdgo_bnco',
'from ws_d_provedores_banco',
'where id_prvdor = :P23_ID_PRVDOR',
'order by nmbre_bnco;'))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_column=>3
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from ws_d_provedores_cliente a',
'where a.cdgo_clnte      = :F_CDGO_CLNTE',
'and a.id_impsto         = :P23_ID_IMPSTO',
'and a.id_impsto_sbmpsto = :P23_ID_IMPSTO_SBMPSTO',
'and a.cdgo_tpo_oprcion  = ''MLTCDT'';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7408300686678906)
,p_name=>'P23_ID_PRVDOR'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7408885878678911)
,p_name=>'P23_CDGO_TPO_OPRCION'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7409693813678919)
,p_name=>'P23_TPO_PRSNA'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>'Tipo de Persona:'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''Personas'' as display_value, ''P'' as return_value from dual',
'union all',
'select ''Empresas'', ''E'' from dual ;',
''))
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_colspan=>2
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'from ws_d_provedores_cliente a',
'where a.cdgo_clnte      = :F_CDGO_CLNTE',
'and a.id_impsto         = :P23_ID_IMPSTO',
'and a.id_impsto_sbmpsto = :P23_ID_IMPSTO_SBMPSTO',
'and a.cdgo_tpo_oprcion  = ''MLTCDT'';'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(7776057105715302)
,p_name=>'P23_NVGDOR'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(75089768355372205)
,p_name=>'P23_VLOR_TTAL_DAB'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76890315552495609)
,p_name=>'P23_CDGO_CLNTE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78096412646206233)
,p_name=>'P23_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_id_impsto NUMBER;',
'BEGIN',
'   IF :P4_ID_IMPSTO_SBMPSTO IS NOT NULL THEN',
'      v_id_impsto := :P4_ID_IMPSTO_SBMPSTO;',
'   ELSIF :P306_ID_IMPSTO_SBMPSTO IS NOT NULL THEN',
'      v_id_impsto := :P306_ID_IMPSTO_SBMPSTO;',
'   ELSE',
'      v_id_impsto := NULL;',
'   END IF;',
'   ',
'   RETURN v_id_impsto;',
'END;',
''))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78097188573206240)
,p_name=>'P23_ID_IMPSTO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78097276239206241)
,p_name=>'P23_VGNCIA_PRDO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_vigencia_prdo clob; ',
'BEGIN',
'   IF :P306_VGNCIA_PRDO IS NOT NULL THEN',
'      v_vigencia_prdo := :P306_VGNCIA_PRDO;',
'   ELSIF :P4_VGNCIA_PRDO IS NOT NULL THEN',
'      v_vigencia_prdo := :P4_VGNCIA_PRDO;',
'   ELSE',
'      v_vigencia_prdo := NULL;',
'   END IF;',
'   ',
'   RETURN v_vigencia_prdo;',
'END;',
''))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78097392813206242)
,p_name=>'P23_ID_SJTO_IMPSTO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'   v_id_sujeto NUMBER;',
'BEGIN',
'   IF :P306_ID_SJTO_IMPSTO IS NOT NULL THEN',
'      v_id_sujeto := :P306_ID_SJTO_IMPSTO;',
'   ELSIF :P4_ID_SJTO_IMPSTO IS NOT NULL THEN',
'      v_id_sujeto := :P4_ID_SJTO_IMPSTO;',
'   ELSE',
'      v_id_sujeto := NULL;',
'   END IF;',
'   ',
'   RETURN v_id_sujeto;',
'END;',
''))
,p_item_default_type=>'PLSQL_FUNCTION_BODY'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78097429547206243)
,p_name=>'P23_FCHA'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_item_default=>'P6_FCHA'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78097555100206244)
,p_name=>'P23_ACCION'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_item_default=>'P'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78097767106206246)
,p_name=>'P23_ID_ORGEN'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78474657294851071)
,p_name=>'P23_CDGO_IDNTFCCION_TPO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>unistr('Tipo de Identificaci\00F3n')
,p_display_as=>'PLUGIN_BE.CTB.SELECT2'
,p_named_lov=>'LV_IDENTIFICACIONES_TIPO'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_IDNTFCCION_TPO as d,',
'       CDGO_IDNTFCCION_TPO as r',
'  from DF_S_IDENTIFICACIONES_TIPO',
' order by 1'))
,p_lov_display_null=>'YES'
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'SINGLE'
,p_attribute_08=>'CIC'
,p_attribute_10=>'300'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78474975248854597)
,p_name=>'P23_IDNTFCCION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>unistr('N\00FAmero Documento')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'''numeroEntero'');"'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78475279749857659)
,p_name=>'P23_PRMER_NMBRE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>'Primer Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78475509338860179)
,p_name=>'P23_SGNDO_NMBRE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>'Segundo Nombre'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78475873640862908)
,p_name=>'P23_PRMER_APLLDO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>'Primer Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>40
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78476139147865444)
,p_name=>'P23_SGNDO_APLLDO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>'Segundo Apellido'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>40
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201540196651457)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78476422582867602)
,p_name=>'P23_TLFNO_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>unistr('Tel\00E9fono')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78476707890869977)
,p_name=>'P23_TLFNO_2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78477060308871673)
,p_name=>'P23_TLFNO_3'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78477326312874190)
,p_name=>'P23_DRCCION_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>unistr('Direcci\00F3n')
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78477636139877204)
,p_name=>'P23_DRCCION_2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78477955858882313)
,p_name=>'P23_DRCCION_3'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78478241997884149)
,p_name=>'P23_EMAIL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_prompt=>'Email'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>70
,p_begin_on_new_line=>'N'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(78478559015886445)
,p_name=>'P23_ID_TRCRO'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(87916232690266608)
,p_name=>'P23_CDGO_PRVDOR'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89517954901717302)
,p_name=>'P23_ID_CNVNIO'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(89518096115717303)
,p_name=>'P23_NMRO_CTAS'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(96232258146973203)
,p_name=>'P23_CDGO_ORGN_TPO'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(97974479925745101)
,p_name=>'P23_CDGO_RCBO_TPO'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_api.id(78094512312206214)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(7408201675678905)
,p_computation_sequence=>10
,p_computation_item=>'P23_ID_PRVDOR'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_prvdor',
'from ws_d_provedores_cliente',
'where cdgo_clnte = :F_CDGO_CLNTE',
'and id_impsto = :P23_ID_IMPSTO',
'and id_impsto_sbmpsto = :P23_ID_IMPSTO_SBMPSTO;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78095619712206225)
,p_validation_name=>'Valida estructura de email'
,p_validation_sequence=>10
,p_validation=>'P23_EMAIL'
,p_validation2=>'^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>'Ingrese un correo valido.'
,p_associated_item=>wwv_flow_api.id(78478241997884149)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78095796213206226)
,p_validation_name=>unistr('Valida direcci\00F3n vac\00EDo')
,p_validation_sequence=>20
,p_validation=>'P23_DRCCION_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vac\00EDo, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(78097658361206245)
,p_associated_item=>wwv_flow_api.id(78477326312874190)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78095894794206227)
,p_validation_name=>unistr('Valida el primer nombre vac\00EDo')
,p_validation_sequence=>30
,p_validation=>'P23_PRMER_NMBRE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vac\00EDo, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(78097658361206245)
,p_associated_item=>wwv_flow_api.id(78475279749857659)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78095928638206228)
,p_validation_name=>unistr('Valida el primer apellido vac\00EDo')
,p_validation_sequence=>40
,p_validation=>'P23_PRMER_APLLDO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vac\00EDo, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(78097658361206245)
,p_associated_item=>wwv_flow_api.id(78475873640862908)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78096049585206229)
,p_validation_name=>unistr('Valida el tipo de identificacion vac\00EDo')
,p_validation_sequence=>50
,p_validation=>'P23_CDGO_IDNTFCCION_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vac\00EDo, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(78097658361206245)
,p_associated_item=>wwv_flow_api.id(78474657294851071)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
end;
/
begin
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78096826107206237)
,p_validation_name=>unistr('Validar tel\00E9fono vac\00EDo')
,p_validation_sequence=>60
,p_validation=>'P23_TLFNO_1'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vac\00EDo, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(78097658361206245)
,p_associated_item=>wwv_flow_api.id(78476422582867602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(78097004266206239)
,p_validation_name=>unistr('Valida email vac\00EDo')
,p_validation_sequence=>90
,p_validation=>'P23_EMAIL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vac\00EDo, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(78097658361206245)
,p_associated_item=>wwv_flow_api.id(78478241997884149)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5516352087658722)
,p_validation_name=>'Valida nombre con letras y espacios'
,p_validation_sequence=>110
,p_validation=>'P23_PRMER_NMBRE'
,p_validation2=>unistr('^[A-Za-z\00C1\00C9\00CD\00D3\00DA\00E1\00E9\00ED\00F3\00FA ]+$')
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('S\00F3lo se permiten espacios y letras.')
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(78475279749857659)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5516494920658723)
,p_validation_name=>'Validar nombre con letras y espacio'
,p_validation_sequence=>120
,p_validation=>'P23_SGNDO_NMBRE'
,p_validation2=>unistr('^[A-Za-z\00C1\00C9\00CD\00D3\00DA\00E1\00E9\00ED\00F3\00FA ]*$')
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('S\00F3lo se permiten espacios y letras')
,p_associated_item=>wwv_flow_api.id(78475509338860179)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5516507739658724)
,p_validation_name=>'Validar apellido con espacios y letras'
,p_validation_sequence=>130
,p_validation=>'P23_PRMER_APLLDO'
,p_validation2=>unistr('^[A-Za-z\00C1\00C9\00CD\00D3\00DA\00E1\00E9\00ED\00F3\00FA ]+$')
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('S\00F3lo se permiten espacios y letras')
,p_associated_item=>wwv_flow_api.id(78475873640862908)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5516603037658725)
,p_validation_name=>'Validar apellido con espacios, letras o NULL'
,p_validation_sequence=>140
,p_validation=>'P23_SGNDO_APLLDO'
,p_validation2=>unistr('^[A-Za-z\00C1\00C9\00CD\00D3\00DA\00E1\00E9\00ED\00F3\00FA ]*$')
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('S\00F3lo se permiten espacios y letras.')
,p_associated_item=>wwv_flow_api.id(78476139147865444)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(162735927261619506)
,p_validation_name=>unistr('Valida tel\00E9fono con n\00FAmeros')
,p_validation_sequence=>160
,p_validation=>'P23_TLFNO_1'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('S\00F3lo se permiten n\00FAmeros.')
,p_associated_item=>wwv_flow_api.id(78476422582867602)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(162736017670619507)
,p_validation_name=>unistr('Valida documento vac\00EDo')
,p_validation_sequence=>170
,p_validation=>'P23_IDNTFCCION'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>unistr('Campo #LABEL# vac\00EDo, por favor verifique')
,p_when_button_pressed=>wwv_flow_api.id(78097658361206245)
,p_associated_item=>wwv_flow_api.id(78474975248854597)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7408944008678912)
,p_validation_name=>'Valida estructura del tipo de identificacion Cedula de Ciudadania'
,p_validation_sequence=>180
,p_validation=>'P23_IDNTFCCION'
,p_validation2=>'^[1-9][0-9]{3,9}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('Ingrese un n\00FAmero de c\00E9dula v\00E1lido')
,p_validation_condition=>'P23_CDGO_IDNTFCCION_TPO'
,p_validation_condition2=>'C'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(78474975248854597)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7409057474678913)
,p_validation_name=>'Valida estructura del tipo de Tarjeta de Identidad'
,p_validation_sequence=>190
,p_validation=>'P23_IDNTFCCION'
,p_validation2=>'^[1-9][0-9]{4,11}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('Ingrese un n\00FAmero de Tarjeta de Identidad v\00E1lido')
,p_validation_condition=>'P23_CDGO_IDNTFCCION_TPO'
,p_validation_condition2=>'T'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(78474975248854597)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7409119359678914)
,p_validation_name=>'Valida estructura del tipo de identificacion Pasaporte'
,p_validation_sequence=>200
,p_validation=>'P23_IDNTFCCION'
,p_validation2=>'^[a-zA-Z0-9_]{4,16}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('Ingrese un n\00FAmero de pasaporte v\00E1lido')
,p_validation_condition=>'P23_CDGO_IDNTFCCION_TPO'
,p_validation_condition2=>'P'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(78474975248854597)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7409201311678915)
,p_validation_name=>unistr('Valida estructura del tipo de identificacion C\00E9dula de extranjer\00EDa')
,p_validation_sequence=>210
,p_validation=>'P23_IDNTFCCION'
,p_validation2=>'^([a-zA-Z]{1,5})?[1-9][0-9]{3,7}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('Ingrese un n\00FAmero de C\00E9dula de extranjer\00EDa v\00E1lido')
,p_validation_condition=>'P23_CDGO_IDNTFCCION_TPO'
,p_validation_condition2=>'E'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(78474975248854597)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(7409374859678916)
,p_validation_name=>unistr('Valida estructura del tipo de identificacion N\00FAmero de Identificaci\00F3n Tributaria')
,p_validation_sequence=>220
,p_validation=>'P23_IDNTFCCION'
,p_validation2=>'^[1-9]\d{6,9}$'
,p_validation_type=>'REGULAR_EXPRESSION'
,p_error_message=>unistr('Ingrese un N\00FAmero de Identificaci\00F3n Tributaria v\00E1lido')
,p_validation_condition=>'P23_CDGO_IDNTFCCION_TPO'
,p_validation_condition2=>'N'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_api.id(78474975248854597)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(162735842274619505)
,p_validation_name=>unistr('Valida identificaci\00F3n con n\00FAmeros')
,p_validation_sequence=>250
,p_validation=>'P23_IDNTFCCION'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>unistr('S\00F3lo se permiten n\00FAmeros.')
,p_validation_condition=>unistr(':P23_CDGO_IDNTFCCION_TPO not in (''P'',''E'',''N'',''C'',''T'')  --Pasaporte, c\00E9dula de exranjeria,N\00FAmero de Identificaci\00F3n Tributaria, c\00E9dula,Tarjeta de Identidad')
,p_validation_condition_type=>'SQL_EXPRESSION'
,p_associated_item=>wwv_flow_api.id(78474975248854597)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(78479746886903091)
,p_name=>'Al cambiar item P23_IDNTFCCION'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_IDNTFCCION'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(78480179802903127)
,p_event_id=>wwv_flow_api.id(78479746886903091)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attribute_02=>'Y'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(76889898803495604)
,p_name=>unistr('al hacer clic en el bot\00F3n pago pse')
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(78094918408206218)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7408797597678910)
,p_event_id=>wwv_flow_api.id(76889898803495604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  cdgo_tpo_oprcion ',
'into    :P23_CDGO_TPO_OPRCION',
'from ws_d_provedores_cliente',
'where cdgo_clnte        = :F_CDGO_CLNTE',
'  and id_prvdor         = :P23_ID_PRVDOR',
'  and id_impsto         = :P23_ID_IMPSTO ',
'  and id_impsto_sbmpsto = :P23_ID_IMPSTO_SBMPSTO ',
'  and actvo = ''S'' ;'))
,p_attribute_02=>'P23_CDGO_TPO_OPRCION'
,p_attribute_03=>'P23_CDGO_TPO_OPRCION'
,p_attribute_04=>'N'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(76889944595495605)
,p_event_id=>wwv_flow_api.id(76889898803495604)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'cargarModal();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(89734012281824219)
,p_name=>unistr('Al cargar p\00E1gina')
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(89734161664824220)
,p_event_id=>wwv_flow_api.id(89734012281824219)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(89733933391824218)
,p_attribute_01=>'N'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7775966607715301)
,p_event_id=>wwv_flow_api.id(89734012281824219)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'// Obtener el navegador',
'/*function detectarNavegador() {',
'    ',
'    //apex.item("P23_NVGDOR").setValue(null);',
'    ',
'    let userAgent = navigator.userAgent;',
'    let navegador = "Navegador desconocido"; // Valor por defecto',
'',
'    if (userAgent.includes("Edg")) {',
'        navegador = "Microsoft Edge";',
'    } else if (userAgent.includes("Chrome")) {',
'        navegador = "Google Chrome";',
'    } else if (userAgent.includes("Firefox")) {',
'        navegador = "Mozilla Firefox";',
'    } else if (userAgent.includes("Safari") && !userAgent.includes("Chrome")) {',
'        navegador = "Apple Safari";',
'    } else if (userAgent.includes("MSIE") || userAgent.includes("Trident")) {',
'        navegador = "Internet Explorer";',
'    }',
'    return navegador;',
'}*/',
'',
'// Asignar el valor a un Item  ',
' apex.item("P23_NVGDOR").setValue(navigator.userAgent);',
'',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7408488792678907)
,p_name=>'Al cambiar item P23_CDGO_BNCO'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_CDGO_BNCO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7408595706678908)
,p_event_id=>wwv_flow_api.id(7408488792678907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P23_CDGO_BNCO'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7410380687678926)
,p_name=>'Al cambiar item P23_TPO_PRSNA'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_TPO_PRSNA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7410478447678927)
,p_event_id=>wwv_flow_api.id(7410380687678926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P23_TPO_PRSNA'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(7776104626715303)
,p_name=>'New'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P23_NVGDOR'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(7776249706715304)
,p_event_id=>wwv_flow_api.id(7776104626715303)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P23_NVGDOR'
,p_stop_execution_on_error=>'Y'
,p_wait_for_result=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78478839267888637)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Carga Pagador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'   ',
'   :P23_CDGO_CLNTE         := :F_CDGO_CLNTE;',
'   :P23_FCHA               := :P23_FCHA;',
'   :P23_CDGO_ORGN_TPO      := :P23_CDGO_ORGN_TPO;',
'   :P23_ID_IMPSTO          := :P23_ID_IMPSTO;',
'   :P23_VLOR_TTAL_DAB      := :P23_VLOR_TTAL_DAB;',
'   :P23_CDGO_RCBO_TPO      := :P23_CDGO_RCBO_TPO;',
'   ',
'   begin',
'       -- Si existe tercero, cargamos los campos.',
'       select	a.cdgo_idntfccion_tpo',
'              , a.prmer_nmbre',
'              , a.sgndo_nmbre',
'              , a.prmer_aplldo',
'              , a.sgndo_aplldo',
'              , a.tlfno',
'              , a.drccion',
'              , a.email',
'              , a.id_trcro',
'        into :P23_CDGO_IDNTFCCION_TPO',
'           , :P23_PRMER_NMBRE',
'           , :P23_SGNDO_NMBRE',
'           , :P23_PRMER_APLLDO',
'           , :P23_SGNDO_APLLDO',
'           , :P23_TLFNO_1',
'           , :P23_DRCCION_1',
'           , :P23_EMAIL',
'           , :P23_ID_TRCRO',
'        from si_c_terceros a',
'        where a.idntfccion = :P23_IDNTFCCION',
'          and a.cdgo_clnte = :F_CDGO_CLNTE;',
'       ',
'    exception',
'        when others then',
'            :P23_CDGO_IDNTFCCION_TPO  := null;',
'            :P23_PRMER_NMBRE		  := null;',
'            :P23_SGNDO_NMBRE		  := null;',
'            :P23_PRMER_APLLDO	      := null;',
'            :P23_SGNDO_APLLDO	      := null;',
'            :P23_TLFNO_1			  := null;',
'            :P23_TLFNO_2			  := null;',
'            :P23_TLFNO_3			  := null;',
'            :P23_DRCCION_1		      := null;',
'            :P23_DRCCION_2		      := null;',
'            :P23_DRCCION_3		      := null;',
'            :P23_EMAIL			      := null;',
'            :P23_ID_TRCRO             := null;',
'    end;',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(78096368619206232)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Registrar tercero y pagador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    ',
'    --Se registra como tercero',
'    begin',
'        ',
'        insert into si_c_terceros(cdgo_clnte,       cdgo_idntfccion_tpo,        idntfccion,             prmer_nmbre, ',
'                                  sgndo_nmbre,      prmer_aplldo,               sgndo_aplldo,           drccion, ',
'                                  email,            tlfno,                      indcdor_cntrbynte,      indcdr_fncnrio)',
'                   ',
'                          values(:F_CDGO_CLNTE,    :P23_CDGO_IDNTFCCION_TPO,   :P23_IDNTFCCION,        :P23_PRMER_NMBRE,',
'                                 :P23_SGNDO_NMBRE, :P23_PRMER_APLLDO,          :P23_SGNDO_APLLDO,      :P23_DRCCION_1, ',
'                                 :P23_EMAIL,       :P23_TLFNO_1,               ''S'',                    ''N'') ',
'                       ',
'                       returning id_trcro into :P23_ID_TRCRO;',
'                ',
'    exception',
'        when others then',
unistr('            raise_application_error(-20001, ''No se pudo realizar el registro, int\00E9ntelo m\00E1s tarde '' || sqlerrm);'),
'    end;',
'    ',
'    --Se registra el pagador',
'    begin',
'        ',
'        insert into re_g_pagadores(cdgo_idntfccion_tpo,        cdgo_clnte,             idntfccion,             ',
'                                   prmer_nmbre,                sgndo_nmbre,            prmer_aplldo,',
'                                   sgndo_aplldo,               tlfno_1,                drccion_1,     ',
'                                   email,                      id_trcro)',
'',
'                           values(:P23_CDGO_IDNTFCCION_TPO,   :F_CDGO_CLNTE,           :P23_IDNTFCCION, ',
'                                  :P23_PRMER_NMBRE,           :P23_SGNDO_NMBRE,        :P23_PRMER_APLLDO, ',
'                                  :P23_SGNDO_APLLDO,          :P23_TLFNO_1,            :P23_DRCCION_1, ',
'                                  :P23_EMAIL,                 :P23_ID_TRCRO);',
'    exception',
'        when others then',
unistr('            raise_application_error(-20002, ''No se pudo realizar el registro, int\00E9ntelo m\00E1s tarde '' || sqlerrm);'),
'    end;',
'    ',
'    commit;',
'',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(78097658361206245)
,p_process_when=>'P23_ID_TRCRO'
,p_process_when_type=>'ITEM_IS_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(89736032076824239)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ActualizarDatosPagador'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    o_cdgo_rspsta    number;',
'    o_mnsje_rspsta   varchar2(1000);',
'    v_dcmnto_pgdo    number := 0;',
'    v_trnsccnes_pndntes number;',
'    v_dtlle_pgos_pdndntes clob;',
'begin',
'    -- Validar si el documento ya fue pagado',
'    begin',
'        select 1',
'          into v_dcmnto_pgdo',
'          from v_re_g_pagadores_documento td',
'         where td.id_orgen = :P23_ID_ORGEN',
'         and td.indcdor_estdo_trnsccion in (''AP'',''PE'')',
'         and rownum <= 1;',
'    exception',
'        when no_data_found then',
'            v_dcmnto_pgdo := 0;',
'    end;',
'    ',
'    if v_dcmnto_pgdo > 0 then',
'        apex_json.open_object();',
'        apex_json.write(''o_cdgo_rspsta'',  1);',
unistr('        apex_json.write(''o_mnsje_rspsta'', ''El documento que intenta pagar ya ha sido aplicado o est\00E1 pendiente por responder.'');'),
'        apex_json.close_object();',
'    else',
'        if :P23_ID_TRCRO is not null then',
'            ',
'            -- Se consulta si tiene transacciones en estado pendiente',
'            select count(1) into v_trnsccnes_pndntes',
'            from v_re_g_pagadores_documento',
'            where id_trcro = :P23_ID_TRCRO',
'              and indcdor_estdo_trnsccion IN (''PE'',''IN'');',
'            --INSERT INTO MUERTO (n_001, v_001, t_001) values (23, ''v_trnsccnes_pndntes: ''||v_trnsccnes_pndntes, systimestamp); COMMIT;',
'            if nvl(v_trnsccnes_pndntes,0) > 0 then',
'                begin',
'                    ',
'                    with documentos as',
'                     (select a.id_dcmnto, a.nmro_dcmnto, a.vlor_ttal_dcmnto',
'                        from re_g_documentos a',
'                      union',
'                      select b.id_dclrcion, b.nmro_cnsctvo, b.vlor_pago',
'                        from gi_g_declaraciones b)',
'                    ',
'                    select json_arrayagg(',
'                                json_object(',
'                                      ''nmbre_impsto_sbmpsto''    value p.nmbre_impsto_sbmpsto,',
'                                       ''id_orgen''               value p.id_orgen,',
'                                       ''nmro_dcmnto''            value d.nmro_dcmnto,',
'                                       ''vlor_ttal_dcmnto''       value to_char(d.vlor_ttal_dcmnto, :F_FRMTO_MNDA),',
'                                       ''dscrpcion_estdo_trnsccion'' value p.dscrpcion_estdo_trnsccion,',
'                                       ''fcha_rgstro''            value to_char(p.fcha_rgstro,''dd/mm/yyyy hh24:mi:ss'')',
'                                )',
'                            )',
'                      into v_dtlle_pgos_pdndntes',
'                      from v_re_g_pagadores_documento p',
'                      join documentos d on d.id_dcmnto = p.id_orgen',
'                      where id_trcro = :P23_ID_TRCRO',
'                      and p.indcdor_estdo_trnsccion IN (''PE'',''IN'');',
'              exception',
'                  when others then',
'                      v_dtlle_pgos_pdndntes := null;',
'              end;',
'           end if;',
'          ',
'            ',
unistr('            -- Se actualiza la informaci\00F3n del pagador'),
'            pkg_ws_pagos_placetopay.prc_ac_datos_pagador(p_cdgo_clnte     =>    :P23_CDGO_CLNTE,',
'                                                          p_id_trcro      =>    :P23_ID_TRCRO,',
'                                                          p_prmer_nmbre   =>    :P23_PRMER_NMBRE,',
'                                                          p_sgndo_nmbre   =>    :P23_SGNDO_NMBRE,',
'                                                          p_prmer_aplldo  =>    :P23_PRMER_APLLDO,',
'                                                          p_sgndo_aplldo  =>    :P23_SGNDO_APLLDO,',
'                                                          p_tlfno_1       =>    :P23_TLFNO_1,',
'                                                          p_drccion_1     =>    :P23_DRCCION_1,',
'                                                          p_email		  =>	:P23_EMAIL,',
'                                                          o_cdgo_rspsta   =>    o_cdgo_rspsta,',
'                                                          o_mnsje_rspsta  =>    o_mnsje_rspsta);',
'',
'',
'            apex_json.open_object();',
'            apex_json.write(''o_cdgo_rspsta'',  o_cdgo_rspsta);',
'            apex_json.write(''o_trnccnes_pndntes'', nvl(v_trnsccnes_pndntes,0));',
'            apex_json.write(''o_dtlle_pgos_pndntes'', v_dtlle_pgos_pdndntes);',
'            apex_json.write(''o_mnsje_rspsta'', o_mnsje_rspsta);',
'            apex_json.close_object();',
'        end if;',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
