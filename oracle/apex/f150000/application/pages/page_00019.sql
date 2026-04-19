prompt --application/pages/page_00019
begin
wwv_flow_api.create_page(
 p_id=>19
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>unistr('Cambiar contrase\00F1a')
,p_step_title=>unistr('Cambiar contrase\00F1a')
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/registro.css?v=1.25'))
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'AMOLINA'
,p_last_upd_yyyymmddhh24miss=>'20200725125604'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(76961064292275617)
,p_plug_name=>'Cambiar Clave'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252179169018651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>10
,p_plug_display_column=>2
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(78786051312062704)
,p_plug_name=>unistr('<i><b>Condiciones de la Contrase\00F1a</b></i>')
,p_parent_plug_id=>wwv_flow_api.id(76961064292275617)
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_api.id(252174563286651394)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h5>',
'    <i>',
unistr('        <b>1.</b> La contrase\00F1a debe tener al menos 8 caracteres<br>'),
unistr('        <b>2.</b> La contrase\00F1a debe contener letras may\00FAsculas y min\00FAsculas, numeros y caracteres especiales. <br>'),
unistr('        Los car\00E1cteres permitido son:  / * _ . , : ; @ # ! \00A1 $ % \00BF ? & { } + <br>'),
'        Por ejemplo: oNQZnz$Hx2.<br>',
'    </i>',
'</h5>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(76961450926275621)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(76961064292275617)
,p_button_name=>'Btn_Cambiar_Clave'
,p_button_static_id=>'btn_cambiar_clave'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--gapRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cambiar Clave'
,p_button_position=>'REGION_TEMPLATE_CHANGE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save-as'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76961187341275618)
,p_name=>'P19_CLAVE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(76961064292275617)
,p_prompt=>unistr('Contrase\00F1a Actual')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(101451371079889838)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76961211929275619)
,p_name=>'P19_CLAVE_NUEVA'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(76961064292275617)
,p_prompt=>unistr('Nueva Contrase\00F1a ')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(101451371079889838)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76961359191275620)
,p_name=>'P19_VALIDAR_CLAVE_NUEVA'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(76961064292275617)
,p_prompt=>unistr('Validar Nueva Contrase\00F1a')
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_field_template=>wwv_flow_api.id(101451371079889838)
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(76961682732275623)
,p_name=>'P19_ID_USRIO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(76961064292275617)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(78785715909062701)
,p_name=>'Cambiar Clave'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_api.id(76961450926275621)
,p_bind_type=>'bind'
,p_bind_event_type=>'click'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(78785828590062702)
,p_event_id=>wwv_flow_api.id(78785715909062701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function cambiarClave() {',
'   try {',
'       await apex.server.process("cambiarClave", {',
'           pageItems: "#F_CDGO_CLNTE, #F_ID_USRIO, #P19_CLAVE, #P19_CLAVE_NUEVA, #P19_VALIDAR_CLAVE_NUEVA"',
'       },{',
'           success: function(data) {',
'               console.log(data);',
'               console.log(data.type);',
'               console.log(data.msg);',
'',
'               if(data.type === ''ERROR'') {',
'                   console.log(data.msg);',
'                   /*apex.message.clearErrors();',
'                   apex.message.showErrors([',
'                       {',
'                           type:       "error",',
'                           location:   "page",',
'                           message:    data.msg,',
'                           unsafe:     false',
'                       }',
'                   ]);*/',
'                Swal.fire({',
unistr('                title: ''Informaci\00F3n'','),
'                html: `<h6>${data.msg}</h6>`,',
'                icon: ''info'',',
'                allowEscapeKey: false,',
'                allowOutsideClick: false,',
'                allowEnterKey: false',
'                }).then((result) => {',
'                    null;',
'                })',
'               }else{',
'                    Swal.fire({',
unistr('                    title: ''Informaci\00F3n'','),
'                    html: `<h6>${data.msg}</h6>`,',
'                    icon: ''info'',',
'                    allowEscapeKey: false,',
'                    allowOutsideClick: false,',
'                    allowEnterKey: false',
'                }).then((result) => {',
'                   apex.close_session();',
'                })',
'                   ',
'               }',
'           }',
'       })',
'   ',
'   } catch(e) {',
'       console.log(e);',
'   }',
'}',
'',
'apex.close_session = async function () {',
'    var data = await apex.server.process(''cerrarSesion'');',
'    console.log(data);',
'    window.sessionStorage.removeItem(''token'');',
'    if (data.type === ''OK'') {',
'        window.location.href = data.url;',
'    }',
'}',
unistr('apex.message.confirm("\00BFEst\00E1 seguro de Cambiar la Contrase\00F1a?", function(okPressed) {'),
'  if(okPressed) {',
'      cambiarClave();',
'  }',
'});',
''))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(78786385818062707)
,p_name=>'al soltar la tecla'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_CLAVE_NUEVA'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'($v(''P19_CLAVE_NUEVA'') || ''1'')  === ($v(''P19_VALIDAR_CLAVE_NUEVA'') || ''2'')'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(78786498187062708)
,p_event_id=>wwv_flow_api.id(78786385818062707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(76961450926275621)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79147418011314601)
,p_event_id=>wwv_flow_api.id(78786385818062707)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(76961450926275621)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(78786635653062710)
,p_name=>'Al cambiar la nueva clave'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_CLAVE_NUEVA'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(78786762079062711)
,p_event_id=>wwv_flow_api.id(78786635653062710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\005Cd)(?=.*[/*_.,:;@#!\00A1$%\00BF?&{}+])([A-Za-z\005Cd/*_.,:;@#!\00A1$%\00BF?&{}+]|[^ ]){8,20}$/;'),
'',
'var pass = $v(''P19_CLAVE_NUEVA'');',
'apex.message.clearErrors();',
'',
'if (!regex.test(pass)) {',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: ["page", "inline"],',
'            pageItem: "P19_CLAVE_NUEVA",',
unistr('            message: "No se cumple con las condiciones minimas para una contrase\00F1a.",'),
'            unsafe: false',
'        }',
'    ]);',
'    $(''#t_Alert_Notification'').hide();',
'    document.getElementById(''P19_CLAVE_NUEVA'').focus();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79147571170314602)
,p_name=>'Al soltar tecla'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_VALIDAR_CLAVE_NUEVA'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'($v(''P19_CLAVE_NUEVA'') || ''1'')  === ($v(''P19_VALIDAR_CLAVE_NUEVA'') || ''2'')'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79147621589314603)
,p_event_id=>wwv_flow_api.id(79147571170314602)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(76961450926275621)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79147760342314604)
,p_event_id=>wwv_flow_api.id(79147571170314602)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(76961450926275621)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79147842467314605)
,p_event_id=>wwv_flow_api.id(79147571170314602)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.clearErrors();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79147907391314606)
,p_event_id=>wwv_flow_api.id(79147571170314602)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.message.clearErrors();',
'apex.message.showErrors([',
'    {',
'        type: "error",',
'        location: ["page", "inline"],',
'        pageItem: "P19_VALIDAR_CLAVE_NUEVA",',
unistr('        message: "Las contrase\00F1as no coinciden.",'),
'        unsafe: false',
'    }',
']);',
'$(''#t_Alert_Notification'').hide();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(79148087151314607)
,p_name=>'Al obtener foco'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P19_VALIDAR_CLAVE_NUEVA'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(79148194634314608)
,p_event_id=>wwv_flow_api.id(79148087151314607)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\005Cd)(?=.*[/*_.,:;@#!\00A1$%\00BF?&{}+])([A-Za-z\005Cd/*_.,:;@#!\00A1$%\00BF?&{}+]|[^ ]){8,20}$/;'),
'var pass = $v(''P19_CLAVE_NUEVA'');',
'if (!regex.test(pass)) {',
'    $(''#P19_CLAVE_NUEVA'').focus();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(76961575615275622)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cambiarClave'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    v_prmtros        varchar2(2000) := :F_CDGO_CLNTE ||'':''|| :F_ID_USRIO ||'':''|| :P19_CLAVE || '':''|| :P19_CLAVE_NUEVA ||'':''|| :P19_VALIDAR_CLAVE_NUEVA;',
'    v_json           json_object_t;',
'    v_j              clob;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded''; ',
'    v_json := json_object_t(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''portal/cambiarClave'',',
'                                              p_http_method  => ''POST'',',
'                                              p_parm_name    => apex_util.string_to_table(''cliente:id_usrio:password:password_n:password_nv''),',
'                                              p_parm_value   => apex_util.string_to_table(v_prmtros)));',
'    --v_json_o.get_string(''token'');',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''type'',v_json.get_string(''type''));',
'    apex_json.write(''msg'', v_json.get_string(''msg''));',
'    apex_json.close_object;',
'    /*exception',
'        when others then',
'            apex_json.open_object;',
'            apex_json.write(''type'', ''error'');',
'            apex_json.write(''msg'', ''Error: '' || sqlerrm);',
'            apex_json.close_object;',
'            */',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(76961450926275621)
);
end;
/
