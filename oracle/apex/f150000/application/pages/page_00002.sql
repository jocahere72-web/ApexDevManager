prompt --application/pages/page_00002
begin
wwv_flow_api.create_page(
 p_id=>2
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Declaraciones Gesti\00F3n')
,p_alias=>'DL_FRM_ICA_V1'
,p_step_title=>unistr('Declaraciones Gesti\00F3n')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
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
'            pageItems: "#P2_ID_DCLRCION_VGNCIA_FRMLRIO, #P2_IDNTFCCION"',
'        });',
'',
unistr('        // Verificar si el c\00F3digo de respuesta es 50'),
'        if (validarSujeto.o_cdgo_rspsta === 50) { ',
'            Swal.fire({',
'                title: ''Alerta'',',
unistr('                html: "<strong>Sr(a). Usuario</strong><br><br><strong>Usted no se encuentra autorizado para la gesti\00F3n de declaraciones de este contribuyente.</strong><br><br><strong>Por favor, realice una solicitud de autorizaci\00F3n.</strong>",'),
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
'                    let redirectUrl = `f?p=${v_app_id}:${1}:${v_session}::::P1_ID_MNU:10`;',
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
'            //debugger;',
'            apex.item("P2_ID_SJTO_IMPSTO").setValue(validarSujeto.o_mnsje_rspsta);',
'            apex.item("P2_MSTRAR_FRMLRIO").setValue("S");',
'            apex.submit();  // Enviar los datos del formulario',
'        }',
'    } catch (e) {',
'        console.error("Error en validarSujetoTributo: ", e);',
'    } finally {',
'        $waitPopup.remove();',
'        console.log("Saliendo de validarSujetoTributo()");',
'    }',
'}',
''))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'HGOMEZ'
,p_last_upd_yyyymmddhh24miss=>'20250717124648'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54289512482394101)
,p_plug_name=>'Encabezado Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P2_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54290172005394107)
,p_plug_name=>unistr('B\00FAsqueda Sujeto Tributo')
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P2_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P2_MSTRAR_FRMLRIO <> ''S'''
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(54290701872394113)
,p_plug_name=>'Formulario'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_source_type=>'PLUGIN_COM.INFORTRIBUTOS.FORMULARIO_DECLARACION'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_plug_display_condition_type=>'PLSQL_EXPRESSION'
,p_plug_display_when_condition=>':P2_ID_DCLRCION_VGNCIA_FRMLRIO is not null and :P2_IDNTFCCION is not null and :P2_MSTRAR_FRMLRIO = ''S'''
,p_attribute_01=>'P2_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_attribute_02=>'P2_ID_DCLRCION'
,p_attribute_03=>'Y'
,p_attribute_04=>'Y'
,p_attribute_05=>'Y'
,p_attribute_06=>'Y'
,p_attribute_07=>'Y'
,p_attribute_08=>'P2_ID_SJTO_IMPSTO'
,p_attribute_09=>'P2_IDNTFCCION'
,p_attribute_10=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,1:P3_ID_DCLRCION:&P2_ID_DCLRCION.'
,p_attribute_11=>'declaraciones/gestion'
,p_attribute_13=>'N'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(54290418371394110)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_api.id(54290172005394107)
,p_button_name=>'BTN_CNSLTAR'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Consultar'
,p_button_position=>'BODY'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-window-search'
,p_grid_new_grid=>false
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(5239954528988738)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(54289512482394101)
,p_button_name=>'BTN_REGRESAR'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'Regresar'
,p_button_position=>'REGION_TEMPLATE_PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:&P2_BRANCH.:&SESSION.::&DEBUG.:RP::'
,p_button_condition=>'P2_BRANCH'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-angle-left'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(5239874233988737)
,p_name=>'P2_BRANCH'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(54289512482394101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(12573178896394517)
,p_name=>'P2_CDGO_ASCDO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(54289512482394101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54289610943394102)
,p_name=>'P2_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(54289512482394101)
,p_prompt=>'Tipo de Declaracion'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      b.dscrpcion,',
'            a.id_dclrcion_vgncia_frmlrio',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_formularios            b   on  b.id_frmlrio            =   a.id_frmlrio',
'where       a.id_dclrcion_vgncia_frmlrio    =   :P2_ID_DCLRCION_VGNCIA_FRMLRIO;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_cHeight=>1
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54289785461394103)
,p_name=>'P2_ID_PRDO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(54289512482394101)
,p_prompt=>'Periodo'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.prdo || '' - '' || c.dscrpcion,',
'            c.id_prdo',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   b.id_dclrcion_tpo_vgncia',
'inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P2_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P2_ID_PRDO'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54289802959394104)
,p_name=>'P2_VGNCIA'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(54289512482394101)
,p_prompt=>'Vigencia'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      c.vgncia text,',
'            c.vgncia value',
'from        gi_d_dclrcnes_vgncias_frmlr a',
'inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   b.id_dclrcion_tpo_vgncia',
'inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo;',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Seleccionar-'
,p_lov_cascade_parent_items=>'P2_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_ajax_items_to_submit=>'P2_VGNCIA'
,p_ajax_optimize_refresh=>'Y'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54289981100394105)
,p_name=>'P2_ID_IMPSTO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(54289512482394101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54290298109394108)
,p_name=>'P2_IDNTFCCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(54290172005394107)
,p_prompt=>'CC/NIT:'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(252201624512651457)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54290522449394111)
,p_name=>'P2_MSTRAR_FRMLRIO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(54289512482394101)
,p_item_default=>'N'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54290899441394114)
,p_name=>'P2_ID_DCLRCION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(54290701872394113)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(54290937780394115)
,p_name=>'P2_ID_SJTO_IMPSTO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(54289512482394101)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'N'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(54311243780995401)
,p_name=>'Clic BTN_CNSLTAR'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(54290418371394110)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(54311319577995402)
,p_event_id=>wwv_flow_api.id(54311243780995401)
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
 p_id=>wwv_flow_api.id(54290093667394106)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calcular Impuesto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select      d.id_impsto,',
'                c.vgncia,',
'                c.id_prdo',
'    into        :P2_ID_IMPSTO,',
'                :P2_VGNCIA,',
'                :P2_ID_PRDO',
'    from        gi_d_dclrcnes_vgncias_frmlr a',
'    inner join  gi_d_dclrcnes_tpos_vgncias  b   on  b.id_dclrcion_tpo_vgncia    =   a.id_dclrcion_tpo_vgncia',
'    inner join  df_i_periodos               c   on  c.id_prdo                   =   b.id_prdo',
'    inner join  gi_d_declaraciones_tipo     d   on  d.id_dclrcn_tpo             =   b.id_dclrcn_tpo',
'    where       a.id_dclrcion_vgncia_frmlrio = :P2_ID_DCLRCION_VGNCIA_FRMLRIO;',
'end;'))
,p_process_error_message=>'Problemas al consultar el impuesto asociado al formulario, #SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2_ID_DCLRCION_VGNCIA_FRMLRIO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(12572939321394515)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>unistr('Validar c\00F3digo de Solicitudes de Asociado')
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    select actvo',
'    into :P2_CDGO_ASCDO',
'    from si_d_slctd_asociado_impuesto',
'    where id_impsto = :P2_ID_IMPSTO;',
'    ',
'    exception',
'    when others then',
'    :P2_CDGO_ASCDO := null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'P2_ID_IMPSTO'
,p_process_when_type=>'ITEM_IS_NOT_NULL'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(54311415778995403)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'ajax_validarSujetoTributo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (:P2_CDGO_ASCDO = ''N'' or :P2_CDGO_ASCDO is null) then',
'',
'        declare ',
'            v_prmtros        varchar2(2000) := ''validaSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P2_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P2_IDNTFCCION;',
'            v_json           json_object_t;',
'            v_prueba         varchar2(1000);',
'            v_cdgo_rspsta    number;',
'        begin',
'            apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'            apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'            v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                             p_http_method  => ''POST'',',
'                                                                             p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion_vgncia_frmlrio:p_idntfccion''),',
'                                                                             p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'',
'            v_cdgo_rspsta := v_json.get_string(''o_cdgo_rspsta'');',
'            if (v_json.get_string(''o_cdgo_rspsta'') is null) then',
'                v_cdgo_rspsta := 1000;',
'            end if;',
'',
'            apex_json.open_object;',
'            --apex_json.write(''o_cdgo_rspsta'', v_json.get(''o_cdgo_rspsta'').to_string);',
'            --apex_json.write(''o_mnsje_rspsta'', v_json.get(''o_mnsje_rspsta'').to_string);',
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
'elsif :P2_CDGO_ASCDO = ''S'' then',
'',
'        declare ',
'            v_prmtros        varchar2(2000) := ''validacionSujetoTributo:''|| :F_CDGO_CLNTE ||'':''|| :P2_ID_DCLRCION_VGNCIA_FRMLRIO ||'':'' || :P2_IDNTFCCION || '':'' || :F_ID_USRIO;',
'            v_json           json_object_t;',
'            v_prueba         varchar2(1000);',
'            v_cdgo_rspsta    number;',
'        begin',
'            apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'            apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'            v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''declaraciones/gestion'',',
'                                                                             p_http_method  => ''POST'',',
'                                                                             p_parm_name    => apex_util.string_to_table(''p_accion:p_cdgo_clnte:p_id_dclrcion_vgncia_frmlrio:p_idntfccion:p_id_usrio''),',
'                                                                             p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'',
'            v_cdgo_rspsta := v_json.get_string(''o_cdgo_rspsta'');',
'            if (v_json.get_string(''o_cdgo_rspsta'') is null) then',
'                v_cdgo_rspsta := 1000;',
'            end if;',
'',
'            apex_json.open_object;',
'            --apex_json.write(''o_cdgo_rspsta'', v_json.get(''o_cdgo_rspsta'').to_string);',
'            --apex_json.write(''o_mnsje_rspsta'', v_json.get(''o_mnsje_rspsta'').to_string);',
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
