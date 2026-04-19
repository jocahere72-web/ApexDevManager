prompt --application/pages/page_00008
begin
wwv_flow_api.create_page(
 p_id=>8
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Opciones'
,p_step_title=>'Opciones'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js',
'',
''))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function validarSujetoTributo() {',
'    console.log("Entrando a validarSujetoTributo()");',
'',
'    let $waitPopup = apex.widget.waitPopup();  ',
'',
'    try {',
'        // Llamada al servidor para validar el sujeto tributario',
'        let validarSujeto = await apex.server.process("ajax_validarSujetoTributo", {',
'            pageItems: "#P8_ID_IMPSTO, #P8_IDNTFCCION"',
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
'            apex.item("P8_ID_SJTO_IMPSTO").setValue(validarSujeto.o_mnsje_rspsta);',
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
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20250717154919'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(5217356699825101)
,p_plug_name=>unistr('VALIDACI\00D3N DE INFORMACI\00D3N DE REPRESENTANTE LEGAL, REVISOR FISCAL O CONTADOR.')
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
 p_id=>wwv_flow_api.id(112751239869605363)
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
 p_id=>wwv_flow_api.id(5217560645825103)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(5217356699825101)
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
 p_id=>wwv_flow_api.id(3566101132032803)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(112751239869605363)
,p_button_name=>'btn_rgrsar'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1:P1_ID_MNU:3'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(57480317292899910)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(112751239869605363)
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
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(57480462576899911)
,p_branch_name=>'Go To Page 2'
,p_branch_action=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_ID_DCLRCION_VGNCIA_FRMLRIO,P2_IDNTFCCION,P2_BRANCH:&P8_ID_DCLRCION_VGNCIA_FRMLRIO.,&P8_IDNTFCCION.,&APP_PAGE_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_api.id(57480317292899910)
,p_branch_sequence=>10
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(5219220127825120)
,p_branch_name=>'Go To Page 300'
,p_branch_action=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:RP,300:P300_IDNTFCCION,P300_BRANCH,P300_ID_IMPSTO:&P8_IDNTFCCION.,&APP_PAGE_ID.,&P8_ID_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'PAGINA_300'
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(12571967058394505)
,p_branch_name=>'Go to page 2025010'
,p_branch_action=>'f?p=&APP_ID.:2025010:&SESSION.::&DEBUG.:RP,2025010:P2025010_ID_SJTO_IMPSTO:&P8_ID_SJTO_IMPSTO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
,p_branch_condition_type=>'REQUEST_EQUALS_CONDITION'
,p_branch_condition=>'PAGINA_2025010'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5217485706825102)
,p_name=>'P8_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(5217356699825101)
,p_prompt=>unistr('Identificaci\00F3n/NIT:')
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>2
,p_field_template=>wwv_flow_api.id(252201432664651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_03=>'right'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5218092290825108)
,p_name=>'P8_ID_SJTO_IMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(5217356699825101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5219493273825122)
,p_name=>'P8_RSPSTA'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(5217356699825101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12571592399394501)
,p_name=>'P8_CDGO_ASCDO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(5217356699825101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12571643744394502)
,p_name=>'P8_VLD_SJTO_RSPNSBLE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(5217356699825101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55483042024138624)
,p_name=>'P8_ID_IMPSTO_SBMPSTO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(112751239869605363)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(55483252286138626)
,p_name=>'P8_ID_IMPSTO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(112751239869605363)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57269152210466752)
,p_name=>'P8_CDGO_CLNTE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(112751239869605363)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(57479826158899905)
,p_name=>'P8_ID_DCLRCN_TPO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(112751239869605363)
,p_prompt=>unistr('Tipos de Declaraci\00F3n')
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select  a.dscrpcion as value',
'        , a.id_dclrcn_tpo as id',
'  from gi_d_declaraciones_tipo a ',
' where a.cdgo_clnte        = :F_CDGO_CLNTE',
'   and a.id_impsto         = :P8_ID_IMPSTO',
'   and a.id_impsto_sbmpsto = :P8_ID_IMPSTO_SBMPSTO',
'   and a.actvo             = ''S''',
'   and INDCDOR_PRSNTCION_WEB = ''S'';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_lov_cascade_parent_items=>'P8_CDGO_CLNTE,P8_ID_IMPSTO,P8_ID_IMPSTO_SBMPSTO'
,p_ajax_items_to_submit=>'P8_CDGO_CLNTE,,P8_ID_IMPSTO,P8_ID_IMPSTO_SBMPSTO'
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
 p_id=>wwv_flow_api.id(57479980328899906)
,p_name=>'P8_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(112751239869605363)
,p_prompt=>'Vigencia a Declarar'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.vgncia || '' - '' || c.prdo || '' '' || c.dscrpcion as value',
'       , a.id_dclrcion_vgncia_frmlrio as id',
'    from gi_d_dclrcnes_vgncias_frmlr a',
'    join gi_d_dclrcnes_tpos_vgncias  b on b.id_dclrcion_tpo_vgncia = a.id_dclrcion_tpo_vgncia',
'    join df_i_periodos               c on c.id_prdo                = b.id_prdo',
'   where b.id_dclrcn_tpo = :P8_ID_DCLRCN_TPO',
'     and a.actvo         = ''S''',
'     and b.actvo         = ''S''',
'order by c.vgncia desc',
'       , c.prdo'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Seleccione...'
,p_lov_cascade_parent_items=>'P8_ID_DCLRCN_TPO'
,p_ajax_items_to_submit=>'P8_ID_DCLRCN_TPO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5239416630988733)
,p_validation_name=>unistr('Tipo de Declaraci\00F3n no nulo')
,p_validation_sequence=>10
,p_validation=>'P8_ID_DCLRCN_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# No puede ser nulo'
,p_when_button_pressed=>wwv_flow_api.id(57480317292899910)
,p_associated_item=>wwv_flow_api.id(57479826158899905)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(5239571000988734)
,p_validation_name=>'Formulario Vigencia no nulo'
,p_validation_sequence=>20
,p_validation=>'P8_ID_DCLRCN_TPO'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# No puede ser nulo'
,p_when_button_pressed=>wwv_flow_api.id(57480317292899910)
,p_associated_item=>wwv_flow_api.id(57479980328899906)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(57480039521899907)
,p_name=>'al hacer clic en el tipo de declaracion'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P8_ID_DCLRCN_TPO'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(57480184590899908)
,p_event_id=>wwv_flow_api.id(57480039521899907)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'portal.generarCombo(''#P8_ID_DCLRCION_VGNCIA_FRMLRIO'', ''util/VigenciaFormulario'', { ''tpodclrcion'': $v(`P${portal.pageid}_ID_DCLRCN_TPO`)});'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(5218835005825116)
,p_name=>'Nuevo_1'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(5218972740825117)
,p_event_id=>wwv_flow_api.id(5218835005825116)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P8_IDNTFCCION'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(4256892285896012)
,p_name=>'Alerta Banner'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(4256940622896013)
,p_event_id=>wwv_flow_api.id(4256892285896012)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Swal.fire({',
'  //title: ''Sweet!'',',
' // text: ''Modal with a custom image.'',',
'  imageUrl: ''#APP_IMAGES#BANNERDELINEACION.jpg'',',
'  width: 1150,',
'  Height:287,',
' // imageAlt: ''Custom image''',
'    confirmButtonText: ''Aceptar Terminos''',
'});',
'',
'/*Swal.fire({',
'  //title: ''Sweet!'',',
'  //text: ''Modal with a custom image.'',',
'  imageUrl: ''#APP_IMAGES#MENSAJE_RAZON_SOCIAL.jpg'',',
'  width: 800,',
'  height:450,',
unistr('  imageAlt: ''Plazo de presentaci\00F3n de Declaraciones'','),
'  confirmButtonText: ''Aceptar''',
'',
'})*/',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(12572039097394506)
,p_name=>'validar sujeto'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(5217560645825103)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(12572104181394507)
,p_event_id=>wwv_flow_api.id(12572039097394506)
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
 p_id=>wwv_flow_api.id(5217768763825105)
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
 p_id=>wwv_flow_api.id(5219313788825121)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validar_sujeto_impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select  id_sjto_impsto',
'    into    :P8_ID_SJTO_IMPSTO',
'    from    v_si_i_sujetos_impuesto',
'    where   cdgo_clnte      =   :F_CDGO_CLNTE',
'    and     id_impsto       =   :P8_ID_IMPSTO',
'    and     id_sjto_estdo   = 1',
'    and     idntfccion_sjto =   :P8_IDNTFCCION;',
'     :P8_RSPSTA := '''';',
'exception',
'    when no_data_found then',
'         :P8_ID_SJTO_IMPSTO := '''';',
unistr('         :P8_RSPSTA := '' No se encontraton datos, por favor verifique la identificaci\00F3n'';'),
'end;',
'',
'',
''))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(5217560645825103)
,p_process_when_type=>'NEVER'
,p_process_success_message=>'&P8_RSPSTA.'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12571707397394503)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Validar c\00F3digo de Solicitudes de Asociado')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select actvo, vlda_sjto',
'    into :P8_CDGO_ASCDO, :P8_VLD_SJTO_RSPNSBLE',
'    from si_d_slctd_asociado_impuesto',
'    where id_impsto = :P8_ID_IMPSTO;',
'    ',
'    exception',
'    when others then',
'    :P8_CDGO_ASCDO := null;',
'    :P8_VLD_SJTO_RSPNSBLE := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P8_ID_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12571841357394504)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarSujetoTributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (:P8_CDGO_ASCDO = ''N'' or :P8_CDGO_ASCDO is null) then',
'',
'        declare ',
'            v_prmtros        varchar2(2000) := ''validaSujetosTributo:''|| :F_CDGO_CLNTE ||'':''|| :P8_ID_IMPSTO ||'':'' || :P8_IDNTFCCION;',
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
'elsif :P8_CDGO_ASCDO = ''S'' then',
'',
'        declare ',
'            v_prmtros        varchar2(2000) := ''validacionSujetoImpuesto:''|| :F_CDGO_CLNTE ||'':''|| :P8_ID_IMPSTO ||'':'' || :P8_IDNTFCCION || '':'' || :F_ID_USRIO|| '':'' || :P8_VLD_SJTO_RSPNSBLE;',
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
end;
/
