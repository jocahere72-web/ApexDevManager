prompt --application/pages/page_00307
begin
wwv_flow_api.create_page(
 p_id=>307
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'307. Opciones'
,p_step_title=>'Opciones'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function validarSujetoTributo() {',
'    console.log("Entrando a validarSujetoTributo()");',
'',
'    let $waitPopup = apex.widget.waitPopup();  ',
'',
'    try {',
'        // Llamada al servidor para validar el sujeto tributario',
'        let validarSujeto = await apex.server.process("ajax_validarSujetoTributo", {',
'            pageItems: "#P307_ID_IMPSTO, #P307_IDNTFCCION"',
'        });',
'',
unistr('        // Verificar si el c\00F3digo de respuesta es 50'),
'        if (validarSujeto.o_cdgo_rspsta === 50) { ',
'            Swal.fire({',
'                title: ''Alerta'',',
unistr('                html: "Sr(a). Usuario<br><br>Usted no se encuentra autorizado para la gesti\00F3n de declaraciones de este contribuyente. <br><br>Por favor, realice una solicitud de autorizaci\00F3n.",'),
'                icon: ''warning'',',
'                showCancelButton: true,  ',
'                cancelButtonText: ''Cerrar'',  ',
'                confirmButtonText: ''Ir a Solicitudes de Autorizacion'',  ',
'                confirmButtonColor: ''#3085d6'',  ',
'                cancelButtonColor: ''#d33'', ',
'                reverseButtons: true,  ',
'                allowOutsideClick: false,  ',
'                allowEscapeKey: false  ',
'            }).then((result) => {',
'',
unistr('                // Obtener las variables de la aplicaci\00F3n'),
unistr('                var v_app_id = $v(''pFlowId'');      // ID de la aplicaci\00F3n'),
unistr('                var v_page_id = $v(''pFlowStepId''); // ID de la p\00E1gina'),
unistr('                var v_session = $v(''pInstance'');   // ID de la sesi\00F3n'),
'',
'                console.log("APP_ID:", v_app_id);',
'                console.log("PAGE_ID:", v_page_id);',
'                console.log("SESSION:", v_session);',
'',
'                if (result.value === true) {  ',
'',
unistr('                    // Construir la URL de redirecci\00F3n'),
'                    let redirectUrl = `f?p=${v_app_id}:${1}:${v_session}::::P1_ID_MNU:20`;',
'',
'                    console.log("Redirigiendo a:", redirectUrl);  // Verifica la URL',
'                    window.location.href = redirectUrl;  // Redirigir a la URL especificada',
'                } else {',
unistr('                    console.log("El usuario cerr\00F3 la alerta o cancel\00F3.");'),
'                }',
'            });',
'        } else if (validarSujeto.o_cdgo_rspsta !== 0) {',
unistr('            // Si el c\00F3digo de respuesta no es 0 ni 50, mostrar mensaje'),
'            Swal.fire({',
'                title: ''Mensaje'',',
'                text: validarSujeto.o_mnsje_rspsta,',
'                icon: ''info'',',
'                confirmButtonText: ''Aceptar'',',
'                confirmButtonColor: ''#3085d6''',
'            });',
'        } else {',
unistr('            // Caso exitoso (c\00F3digo de respuesta es 0)'),
'            apex.item("P307_ID_SJTO_IMPSTO").setValue(validarSujeto.o_mnsje_rspsta);',
'            apex.submit({request: "PAGINA_2025010"});  ',
'        }',
'    } catch (e) {',
'        console.error("Error en validarSujetoTributo: ", e);',
'    } finally {',
'        $waitPopup.remove();',
'        console.log("Saliendo de validarSujetoTributo()");',
'    }',
'}',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*apex.jQuery(apex.gPageContext$).on("apexreadyend", function (e) { ',
'    portal.generarCombo(''#P8_ID_DCLRCN_TPO'', ''util/DeclaracionesTipo'', { ''cliente'': $v(`P${portal.pageid}_CDGO_CLNTE`), ''impuesto'': $v(`P${portal.pageid}_ID_IMPSTO`), ''subimpuesto'': $v(`P${portal.pageid}_ID_IMPSTO_SBMPSTO`) });',
'    var row = $(''#vigencias .container>.row>.col-10'').parent();',
'    var col = $(''<div class="col col-2"/>'');',
'  //  $(`<a href="/i/public/${$v(''P8_CDGO_CLNTE'')}/InstructivoDeclaraciones.pdf" target="_blank"> Ver Instructivo</a>`).appendTo(col);',
'    col.appendTo(row);',
'});*/'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'https://fonts.googleapis.com/css?family=Roboto:400,500,900,700,100italic,300italic,400italic,500italic,700italic,900italic,300,100',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/impuestos.css',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'))
,p_step_template=>wwv_flow_api.id(252165693921651362)
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'JVARGAS'
,p_last_upd_yyyymmddhh24miss=>'20250731114159'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(134823435586778580)
,p_plug_name=>unistr('Validaci\00F3n de Informaci\00F3n Representante Legal, Revisor Fiscal o Contador')
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_item_display_point=>'BELOW'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Si desea validar y/o modificar la informaci\00F3n del  representante legal, revisor fiscal o contador registrada en nuestro sistema, ingresa el documento de identificaci\00F3n del declarante (empresa o persona jur\00EDdica) y haga clic en el bot\00F3n <b> Validar In')
||unistr('formaci\00F3n </b>, de lo contrario contin\00FAe con el proceso de registro de declaraci\00F3n en la secci\00F3n<b> Tipo de Declaraci\00F3n y Vigencia </b> :'),
'<br>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(242357318756558842)
,p_plug_name=>unistr(' Tipo de Declaraci\00F3n y Vigencia')
,p_region_name=>'vigencias'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(129606625368953576)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(134823435586778580)
,p_button_name=>'BTN_VLDAR_INFRMCION'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Validar Informacion'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-check'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(129608523025953618)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(242357318756558842)
,p_button_name=>'btn_rgrsar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1:P1_CDGO_CLNTE,P1_ID_IMPSTO,P1_ID_IMPSTO_SBMPSTO:&F_CDGO_CLNTE.,&P307_ID_IMPSTO.,&P307_ID_IMPSTO_SBMPSTO.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(129608914220953619)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(242357318756558842)
,p_button_name=>'btn_inciar'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar Declaraci\00F3n')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(145128453512945605)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(242357318756558842)
,p_button_name=>'btn_inciar_1'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Iniciar Declaraci\00F3n Vehiculo')
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-cog'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(129615581190953709)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=&APP_ID.:308:&SESSION.::&DEBUG.:RP,308:P308_ID_DCLRCION_VGNCIA_FRMLRIO,P308_IDNTFCCION,P308_BRANCH:&P307_ID_DCLRCION_VGNCIA_FRMLRIO.,&P307_IDNTFCCION.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(129608914220953619)
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(129536376690869904)
,p_branch_name=>'Go To Page X'
,p_branch_action=>'DECLARE'||wwv_flow.LF||
'    v_url varchar2(2000);'||wwv_flow.LF||
'    v_app number := :APP_ID;--v(''APP_ID'');'||wwv_flow.LF||
'    v_page number := :P307_ID_ALIAS;'||wwv_flow.LF||
'    v_session number := :APP_SESSION;--v(''APP_SESSION'');'||wwv_flow.LF||
'BEGIN'||wwv_flow.LF||
'    v_url := APEX_UTIL.PREPARE_URL('||wwv_flow.LF||
'        p_url => ''f?p='' || v_app || '':'' || v_page || '':'' || v_session ||''::NO::P''||v_page||''_ID_DCLRCION_VGNCIA_FRMLRIO,P''||v_page||''_IDNTFCCION,P''||v_page||''_ID_SJTO_IMPSTO,P''||v_page||''_BRANCH,P''||v_page||''_MSTRAR_FRMLRIO:''||:P307_ID_DCLRCION_VGNCIA_FRMLRIO||'',''||:P307_IDNTFCCION||'',''||NULL||'',''||:APP_PAGE_ID||'',N'','||wwv_flow.LF||
'        p_checksum_type => ''SESSION'');'||wwv_flow.LF||
'    return v_url;'||wwv_flow.LF||
'END;'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'BRANCH_TO_FUNCTION_RETURNING_URL'
,p_branch_when_button_id=>wwv_flow_api.id(129608914220953619)
,p_branch_sequence=>20
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(145128582996945606)
,p_branch_name=>'Go To Page 311'
,p_branch_action=>'f?p=&APP_ID.:311:&SESSION.:iniciar_declaracion:&DEBUG.:RP,311:P311_ID_DCLRCION_VGNCIA_FRMLRIO,P311_IDNTFCCION,P311_BRANCH:&P307_ID_DCLRCION_VGNCIA_FRMLRIO.,&P307_IDNTFCCION.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(145128453512945605)
,p_branch_sequence=>30
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(129614761246953690)
,p_branch_name=>'Go To Page 300'
,p_branch_action=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:RP,300:P300_IDNTFCCION,P300_BRANCH,P300_ID_IMPSTO:&P307_IDNTFCCION.,&APP_PAGE_ID.,&P307_ID_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>40
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'PAGINA_300'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12572263213394508)
,p_branch_name=>'Go to page 2025010'
,p_branch_action=>'f?p=&APP_ID.:2025010:&SESSION.::&DEBUG.:RP,2025010:P2025010_ID_SJTO_IMPSTO:&P307_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>50
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'PAGINA_2025010'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(129615109271953709)
,p_branch_name=>'Ir a Mantenimiento'
,p_branch_action=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'NEVER'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4899594894572021)
,p_name=>'P307_CDGO_ASCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(134823435586778580)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4899729074572023)
,p_name=>'P307_VLD_SJTO_RSPNSBLE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(134823435586778580)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4899842120572024)
,p_name=>'P307_VLDAR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(134823435586778580)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4900367116572029)
,p_name=>'P307_CDGO_RSPSTA'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(134823435586778580)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129607019183953594)
,p_name=>'P307_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(134823435586778580)
,p_prompt=>'CC/NIT:'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129607406557953613)
,p_name=>'P307_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(134823435586778580)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129607853697953613)
,p_name=>'P307_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(134823435586778580)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129609328243953619)
,p_name=>'P307_CDGO_CLNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(242357318756558842)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129609713028953622)
,p_name=>'P307_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(242357318756558842)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129610048449953622)
,p_name=>'P307_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(242357318756558842)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129610455955953622)
,p_name=>'P307_ID_DCLRCN_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(242357318756558842)
,p_prompt=>unistr('Tipos de Declaraci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  a.dscrpcion as value',
'       ,a.id_dclrcn_tpo as id',
'  from gi_d_declaraciones_tipo a ',
' where a.cdgo_clnte        = :P307_CDGO_CLNTE ',
'   and a.id_impsto         = :P307_ID_IMPSTO',
'   and a.id_impsto_sbmpsto = :P307_ID_IMPSTO_SBMPSTO',
'   and a.actvo             = ''S''',
'   and a.indcdor_prsntcion_web = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_lov_cascade_parent_items=>'P307_CDGO_CLNTE,P307_ID_IMPSTO,P307_ID_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P307_CDGO_CLNTE,P307_ID_IMPSTO,P307_ID_IMPSTO_SBMPSTO,P307_ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_colspan=>10
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(129610820054953623)
,p_name=>'P307_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(242357318756558842)
,p_prompt=>'Vigencia a Declarar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.vgncia || '' - '' || c.prdo || '' '' || c.dscrpcion as value',
'       , a.id_dclrcion_vgncia_frmlrio as id',
'    from gi_d_dclrcnes_vgncias_frmlr a',
'    join gi_d_dclrcnes_tpos_vgncias  b on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia',
'    join df_i_periodos               c on c.id_prdo                = b.id_prdo',
'   where b.id_dclrcn_tpo = :P307_ID_DCLRCN_TPO',
'     and a.actvo         = ''S''',
'     and b.actvo         = ''S''',
'order by c.vgncia desc',
'       , c.prdo;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_lov_cascade_parent_items=>'P307_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P307_ID_DCLRCN_TPO,P307_ID_ALIAS'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(148714883793015829)
,p_name=>'P307_ID_ALIAS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(242357318756558842)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(148714930359015830)
,p_computation_sequence=>10
,p_computation_item=>'P307_ID_ALIAS'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id',
'from gi_d_dclrcnes_vgncias_frmlr a',
'join apex_190100.wwv_flow_steps b on b.alias = a.alias',
'where a.id_dclrcion_vgncia_frmlrio = :P307_ID_DCLRCION_VGNCIA_FRMLRIO;'))
,p_compute_when_type=>'NEVER'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129611350307953643)
,p_validation_name=>unistr('Tipo de Declaraci\00F3n no nulo')
,p_validation_sequence=>10
,p_validation=>'P307_ID_DCLRCN_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# No puede ser nulo'
,p_when_button_pressed=>wwv_flow_api.id(129608914220953619)
,p_associated_item=>wwv_flow_api.id(129610455955953622)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(129611727994953651)
,p_validation_name=>'Formulario Vigencia no nulo'
,p_validation_sequence=>20
,p_validation=>'P307_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# No puede ser nulo'
,p_when_button_pressed=>wwv_flow_api.id(129608914220953619)
,p_associated_item=>wwv_flow_api.id(129610820054953623)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(129612854194953666)
,p_name=>'al hacer clic en el tipo de declaracion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P307_ID_DCLRCN_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(129613391314953680)
,p_event_id=>wwv_flow_api.id(129612854194953666)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'portal.generarCombo(''#P307_ID_DCLRCION_VGNCIA_FRMLRIO'', ''util/VigenciaFormulario'', { ''tpodclrcion'': $v(`P${portal.pageid}_ID_DCLRCN_TPO`)});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(129613740056953688)
,p_name=>'Nuevo_1'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(129614238402953689)
,p_event_id=>wwv_flow_api.id(129613740056953688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P307_IDNTFCCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(148715442496015835)
,p_name=>'Al cambiar tipo declaracion o vigencia a declarar'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P307_ID_DCLRCION_VGNCIA_FRMLRIO,P307_ID_DCLRCN_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(148715599738015836)
,p_event_id=>wwv_flow_api.id(148715442496015835)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function Buscar_Alias() {',
'    let $waitPopup = apex.widget.waitPopup();',
'    try {',
'        await apex.server.process("Buscar_Alias", {',
'            pageItems: "#P307_ID_DCLRCN_TPO,#P307_ID_DCLRCION_VGNCIA_FRMLRIO"',
'        }).then(function (resp) {',
'            Object.keys(resp).forEach((f) => {',
'                apex.item(''P307_'' + f).setValue(('''' + resp[f]).trim());',
'            });',
'        }',
'        );',
'',
'',
'    } catch (error) {',
'        console.log(error);',
'    } finally {',
'        if ($waitPopup)',
'            $waitPopup.remove();',
'    }',
'}',
'',
'Buscar_Alias();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4900572760572031)
,p_name=>'validar sujeto'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(129606625368953576)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4900647846572032)
,p_event_id=>wwv_flow_api.id(4900572760572031)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('apex.message.confirm( "\00BFEst\00E1 seguro de haber digitado bien la identificaci\00F3n?", function( okPressed ) {'),
'        if( okPressed ) {',
'            validarSujetoTributo();',
'        }',
'    });'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(129612095408953651)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar_sujeto_tributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'				',
'    v_id_impsto				number;',
'    v_id_sjto_impsto		number;',
'    v_dfncion_sjto_impsto	varchar2(100);',
'    v_id_dclrcion			number;',
'    o_cdgo_prcso	        varchar2(5) := ''WDC1'';',
'    o_cdgo_rspsta           number := 0;',
'    o_mnsje_rspsta          varchar2(4000);',
'    v_error                 exception;',
'    begin',
'        begin',
'            --Se consulta el impuesto',
'            select      c.id_impsto',
'            into		v_id_impsto',
'            from        gi_d_dclrcnes_vgncias_frmlr a',
'            inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'            inner join  gi_d_declaraciones_tipo     c   on  c.id_dclrcn_tpo             =   b.id_dclrcn_tpo',
'            where       a.id_dclrcion_vgncia_frmlrio    =   :p_id_dclrcion_vgncia_frmlrio;',
'        exception',
'            when others then',
'                o_cdgo_rspsta	:= 1;',
'                o_mnsje_rspsta := ''<details>'' ||  ',
'                                        ''<summary>'' || ''No fue posible validar el tributo, '' ||',
'                                        ''por favor intente nuevamente.''||o_mnsje_rspsta || ''</summary>'' ||',
unistr('                                        ''<p>'' || ''Para mas informaci\00F3n consultar el c\00F3digo '' || o_cdgo_prcso || ''-'' || o_cdgo_rspsta || ''.</p>'' ||'),
'                                        ''<p>'' || sqlerrm || ''.</p>'' ||',
'                                  ''</details>'';',
'                raise v_error;',
'        end;',
'',
'        begin',
'            --Se consulta el sujeto impuesto',
'            select  id_sjto_impsto',
'            into    v_id_sjto_impsto',
'            from    v_si_i_sujetos_impuesto',
'            where   cdgo_clnte      =   :p_cdgo_clnte',
'            and     id_impsto       =   v_id_impsto',
'            and     idntfccion_sjto =   :p_idntfccion;',
'        exception',
'            when no_data_found then',
'                begin',
'                    --Consultamos la definicion ',
'                    v_dfncion_sjto_impsto := pkg_gn_generalidades.fnc_cl_defniciones_cliente(p_cdgo_clnte				=> :p_cdgo_clnte,',
'                                                                                             p_cdgo_dfncion_clnte_ctgria=> ''DCL'',',
'                                                                                             p_cdgo_dfncion_clnte		=> ''RST'');',
'',
'                    if (v_dfncion_sjto_impsto = ''-1'') then',
'                        o_cdgo_rspsta	:= 2;',
'                        raise v_error;',
'                    elsif(v_dfncion_sjto_impsto = ''N'')then',
'                        o_cdgo_rspsta	:= 3;',
'                        raise v_error;',
'                    else',
'                        apex_json.open_object;',
'                        apex_json.write(''o_cdgo_rspsta'', o_cdgo_rspsta);',
'                        apex_json.close_object;',
'                    end if;',
'                exception',
'                    when others then',
'                        select decode(o_cdgo_rspsta, 0, 4, o_cdgo_rspsta) into o_cdgo_rspsta from dual;',
'                        o_mnsje_rspsta := ''<details>'' ||  ',
unistr('                                                ''<summary>'' || ''No fue posible validar la identificaci\00F3n del declarante, '' ||'),
'                                                ''por favor intente nuevamente.''||o_mnsje_rspsta || ''</summary>'' ||',
unistr('                                                ''<p>'' || ''Para mas informaci\00F3n consultar el c\00F3digo '' || o_cdgo_prcso || ''-'' || o_cdgo_rspsta || ''.</p>'' ||'),
'                                                ''<p>'' || sqlerrm || ''.</p>'' ||',
'                                          ''</details>'';',
'                        raise v_error;',
'                end;',
'            when others then',
'                o_cdgo_rspsta	:= 5;',
'                o_mnsje_rspsta := ''<details>'' ||  ',
unistr('                                        ''<summary>'' || ''No fue posible validar la identificaci\00F3n del declarante, '' ||'),
'                                        ''por favor intente nuevamente.''||o_mnsje_rspsta || ''</summary>'' ||',
unistr('                                        ''<p>'' || ''Para mas informaci\00F3n consultar el c\00F3digo '' || o_cdgo_prcso || ''-'' || o_cdgo_rspsta || ''.</p>'' ||'),
'                                        ''<p>'' || sqlerrm || ''.</p>'' ||',
'                                  ''</details>'';',
'                raise v_error;',
'        end;',
'',
'end;              '))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(129612478681953665)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar_sujeto_impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (:P307_CDGO_ASCDO = ''N'' or :P307_CDGO_ASCDO is null) then',
'    begin',
'        select id_sjto_impsto',
'        into :P307_ID_SJTO_IMPSTO',
'        from v_si_i_sujetos_impuesto',
'        where cdgo_clnte = :F_CDGO_CLNTE',
'          and id_impsto = :P307_ID_IMPSTO',
'          and idntfccion_sjto = :P307_IDNTFCCION',
'          and id_sjto_estdo = 1; -- activo',
'          ',
'        :P307_RSPSTA := '''';',
'    exception',
'        when no_data_found then',
'            :P307_CDGO_RSPSTA := 10;',
'            :P307_ID_SJTO_IMPSTO := '''';',
unistr('            :P307_RSPSTA := ''No se encontraron datos, por favor verifique la identificaci\00F3n o si el sujeto est\00E1 activo.'';'),
'    end;',
'',
'elsif :P307_CDGO_ASCDO = ''S'' then',
'    begin',
unistr('        -- Primer bloque de validaci\00F3n: Consulta el sujeto impuesto'),
'        select id_sjto_impsto',
'        into :P307_ID_SJTO_IMPSTO',
'        from v_si_i_sujetos_impuesto',
'        where cdgo_clnte = :F_CDGO_CLNTE',
'          and id_impsto = :P307_ID_IMPSTO',
'          and idntfccion_sjto = :P307_IDNTFCCION',
'          and id_sjto_estdo = 1; -- activo',
'          ',
'        :P307_RSPSTA := '''';',
'        :P307_CDGO_RSPSTA := 0;',
'    exception',
'        when no_data_found then',
'            :P307_CDGO_RSPSTA := 20;',
'            :P307_ID_SJTO_IMPSTO := '''';',
unistr('            :P307_RSPSTA := ''No se encontraron datos, por favor verifique la identificaci\00F3n o si el sujeto est\00E1 activo.'';'),
'    end;',
'',
unistr('    -- Segunda validaci\00F3n solo cuando P307_CDGO_ASCDO es ''S'''),
'    begin',
unistr('        -- Validaci\00F3n de existencia en si_i_sujetos_asociados'),
'        select 1',
'        into :P307_VLDAR',
'        from si_i_sujetos_asociados',
'        where cdgo_clnte = :F_CDGO_CLNTE',
'          and id_impsto = :P307_ID_IMPSTO',
'          and id_sjto_impsto = :P307_ID_SJTO_IMPSTO',
'          and id_usrio = :F_ID_USRIO',
'          and actvo = ''S''',
'          and rownum = 1;',
'          ',
'        :P307_RSPSTA := '''';',
'        :P307_VLDAR := null;',
'        :P307_CDGO_RSPSTA := 0;',
'    exception',
'        when no_data_found then',
'            if :P307_VLD_SJTO_RSPNSBLE = ''S'' then',
'                begin',
unistr('                    -- Consulta si el usuario tiene autorizaci\00F3n para el sujeto impuesto'),
'                    select 1',
'                    into :P307_VLDAR',
'                    from sg_g_usuarios a',
'                    inner join si_c_terceros b on a.id_trcro = b.id_trcro',
'                    where a.id_usrio = :F_ID_USRIO',
'                      and a.actvo = ''S''',
'                      and exists (',
'                          select 1',
'                          from v_si_i_sujetos_responsable c',
'                          where c.id_sjto_impsto = :P307_ID_SJTO_IMPSTO',
'                            and c.id_sjto_estdo = 1',
'                            and c.cdgo_idntfccion_tpo = b.cdgo_idntfccion_tpo',
'                            and c.idntfccion_rspnsble = b.idntfccion',
'                      )',
'                      and rownum = 1;',
'',
'                    :P307_RSPSTA := '''';',
'                exception',
'                    when no_data_found then',
'                        :P307_CDGO_RSPSTA := 50;',
'                        :P307_ID_SJTO_IMPSTO := '''';',
unistr('                        :P307_RSPSTA := ''Sr. Usuario no se encuentra autorizado para la gesti\00F3n de declaraciones del sujeto especificado, por favor realizar solicitud de asociaci\00F3n.'';'),
'                end;',
'            elsif :P307_VLD_SJTO_RSPNSBLE = ''N'' or :P307_VLD_SJTO_RSPNSBLE is null then',
'                 :P307_CDGO_RSPSTA := 50;',
'                 :P307_ID_SJTO_IMPSTO := '''';',
unistr('                :P307_RSPSTA := ''Sr. Usuario no se encuentra autorizado para la gesti\00F3n de declaraciones del sujeto especificado, por favor realizar solicitud de asociaci\00F3n.'';'),
'            end if;',
'        when others then',
'            :P307_CDGO_RSPSTA := 50;    ',
'            :P307_ID_SJTO_IMPSTO := '''';',
unistr('            :P307_RSPSTA := ''Estimado usuario, no tiene autorizaci\00F3n para validar la informaci\00F3n del documento especificado.'';'),
'    end;',
'',
'end if;',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(129606625368953576)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P307_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4899679851572022)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar Sujeto Asociado'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select actvo, vlda_sjto',
'    into :P307_CDGO_ASCDO, :P307_VLD_SJTO_RSPNSBLE',
'    from si_d_slctd_asociado_impuesto',
'    where id_impsto = :P307_ID_IMPSTO;',
'    ',
'    exception',
'    when others then',
'    :P307_CDGO_ASCDO := null;',
'    :P307_VLD_SJTO_RSPNSBLE := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P307_ID_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
end;
/
begin
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(4900406689572030)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarSujetoTributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (:P307_CDGO_ASCDO = ''N'' or :P307_CDGO_ASCDO is null) then',
'',
'        declare ',
'            v_prmtros        varchar2(2000) := ''validaSujetosTributo:''|| :F_CDGO_CLNTE ||'':''|| :P307_ID_IMPSTO ||'':'' || :P307_IDNTFCCION;',
'            v_json           json_object_t;',
'            v_prueba         varchar2(1000);',
'            v_cdgo_rspsta    number;',
'        begin',
'            apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'            apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'            v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionSujeto'',',
'                                                                             p_http_method  => ''POST'',',
'                                                                             p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_impsto:p_idntfccion''),',
'                                                                             p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'',
'            v_cdgo_rspsta := v_json.get_string(''o_cdgo_rspsta'');',
'            if (v_json.get_string(''o_cdgo_rspsta'') is null) then',
'                v_cdgo_rspsta := 1000;',
'            end if;',
'',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'            apex_json.write(''o_mnsje_rspsta'', v_json.get_string (''o_mnsje_rspsta''));',
'            apex_json.close_object;',
'',
'            exception',
'                when others then',
'                    apex_json.open_object;',
'                    apex_json.write(''o_cdgo_rspsta'', 100);',
'                    apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
unistr('                                                            ''<summary>'' || ''No fue posible validar la identificaci\00F3n del declarante, '' ||'),
'                                                            ''por favor intente nuevamente.</summary>'' ||',
'                                                            ''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'                                                      ''</details>'' || sqlerrm);',
'                    apex_json.close_object;',
'        end;',
'',
'',
'',
'elsif :P307_CDGO_ASCDO = ''S'' then',
'',
'        declare ',
'            v_prmtros        varchar2(2000) := ''validacionSujetoImpuesto:''|| :F_CDGO_CLNTE ||'':''|| :P307_ID_IMPSTO ||'':'' || :P307_IDNTFCCION || '':'' || :F_ID_USRIO|| '':'' || :P307_VLD_SJTO_RSPNSBLE;',
'            v_json           json_object_t;',
'            v_prueba         varchar2(1000);',
'            v_cdgo_rspsta    number;',
'        begin',
'            apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'            apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'            v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestionSujeto'',',
'                                                                             p_http_method  => ''POST'',',
'                                                                             p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_impsto:p_idntfccion:p_id_usrio:p_vlda_sjto''),',
'                                                                             p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'',
'            v_cdgo_rspsta := v_json.get_string(''o_cdgo_rspsta'');',
'            if (v_json.get_string(''o_cdgo_rspsta'') is null) then',
'                v_cdgo_rspsta := 1000;',
'            end if;',
'',
'            apex_json.open_object;',
'            apex_json.write(''o_cdgo_rspsta'', v_cdgo_rspsta);',
'            apex_json.write(''o_mnsje_rspsta'', v_json.get_string (''o_mnsje_rspsta''));',
'            apex_json.close_object;',
'',
'            exception',
'                when others then',
'                    apex_json.open_object;',
'                    apex_json.write(''o_cdgo_rspsta'', 100);',
'                    apex_json.write(''o_mnsje_rspsta'', ''<details>'' ||  ',
unistr('                                                            ''<summary>'' || ''No fue posible validar la identificaci\00F3n del declarante, '' ||'),
'                                                            ''por favor intente nuevamente.</summary>'' ||',
'                                                            ''<p>'' || ''El servicio no pudo ser gestionado.'' || ''</p>'' ||',
'                                                      ''</details>'' || sqlerrm);',
'                    apex_json.close_object;',
'        end;',
'',
'end if;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(148715604400015837)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Buscar_Alias'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_id_alias   number;',
'begin',
'    select b.id',
'	  into v_id_alias',
'	  from gi_d_dclrcnes_vgncias_frmlr a',
'	  join apex_190100.wwv_flow_steps b on b.alias = a.alias',
'	 where a.id_dclrcion_vgncia_frmlrio = :P307_ID_DCLRCION_VGNCIA_FRMLRIO;',
'   ',
'        apex_json.open_object; ',
'        apex_json.write(''ID_ALIAS'', v_id_alias);',
'        apex_json.close_all;',
'       ',
'exception ',
'    when others then',
'        apex_json.open_object;',
'        apex_json.write(''ID_ALIAS'', '''');',
'        apex_json.close_all;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
