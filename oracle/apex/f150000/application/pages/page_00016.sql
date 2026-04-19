prompt --application/pages/page_00016
begin
wwv_flow_api.create_page(
 p_id=>16
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Recuperar'
,p_step_title=>'Recuperar'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionRecibo.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/capsLock.js?v=111'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.jQuery(apex.gPageContext$).on("apexreadyend", async function (e) {',
'    $(''.t-Form-itemWrapper > .t-Form-itemText'').on(''mousedown mouseup'', function (e) {',
'        var _type = e.type;',
'        var _span = e.currentTarget;',
'        var _input = $(_span).siblings(''input'');',
'        $(_input).attr(''type'', _type === ''mousedown'' ? ''text'' : ''password'');',
'    });',
'',
'    $(document).on(''paste'', function (e) {',
'        e.preventDefault();',
'    });',
'    ',
'    capsLock.init(''.t-Login-region'');    ',
'    portal.validarAcceso();',
'});'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/css/tooltipster.bundle.min.css',
'https://fonts.googleapis.com/css?family=Roboto:400,500,900,700,100italic,300italic,400italic,500italic,700italic,900italic,300,100',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/impuestos.css',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/menu.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'span.t-Login-logo {',
'    background: url(/i/public/&F_CDGO_CLNTE./logo.png);',
'    background-repeat: no-repeat;',
'    background-size: 30rem;',
'    width: 30rem;',
'    height: 20rem;',
'    position: relative;',
'    margin-bottom: -8rem;',
'    top: -2rem;',
'}',
'.t-Form-itemWrapper > .t-Form-itemText {',
'    margin-left: 4px !important;',
'    margin-top: 4px !important;',
'    cursor: pointer !important;',
'} ',
'',
'',
'.t-Login-region {',
'  width: 100%;',
'  margin: 0 auto;',
'  background: rgba(226, 226, 226, 0.3);',
'  padding: 20px 22px;',
'  border-top-color: rgba(255,255,255,.4);',
'  border-left-color: rgba(255,255,255,.4);',
'  border-bottom-color: rgba(60,60,60,.4);',
'  border-right-color: rgba(60,60,60,.4);',
'  border-radius : 10px; ',
'}'))
,p_step_template=>wwv_flow_api.id(252162518438651337)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20210210162901'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(132881822363997259)
,p_plug_name=>'<p></p>'
,p_region_name=>'rgion_pass'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178893500651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_display_point=>'BODY'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul>',
'<li><span style="color: #ff0000;">La contrase&ntilde;a debe tener al menos 5 caracteres y m&aacute;ximo 10 caracteres.</span></li>',
'</ul>'))
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70966929270688374)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(132881822363997259)
,p_button_name=>'btn_crear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Crear Contrase\00F1a')
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P16_ID_TRCRO_PRTAL'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(70496523349757223)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_api.id(132881822363997259)
,p_button_name=>'btn_rstblcer'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Restablecer Contrase\00F1a')
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_condition=>'P16_ID_TRCRO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_branch(
 p_id=>wwv_flow_api.id(78786587041062709)
,p_branch_action=>'f?p=&APP_ID.:101:&SESSION.::&DEBUG.:RP,101::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70496363670757221)
,p_name=>'P16_ID_TRCRO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(132881822363997259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70496836220757226)
,p_name=>'P16_TKEN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(132881822363997259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70967333046688386)
,p_name=>'P16_TYPE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(132881822363997259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70967706760688394)
,p_name=>'P16_ID_TRCRO_PRTAL'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(132881822363997259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70968178069688394)
,p_name=>'P16_PASSWORD'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_api.id(132881822363997259)
,p_prompt=>unistr('Nueva Contrase\00F1a')
,p_post_element_text=>'<span class="fa fa-eye" aria-hidden="true"></span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul>',
unistr('    <li>La contrase\00F1a debe tener al menos 5 caracteres y m\00E1ximo 10 caracteres.</li>  '),
'</ul>'))
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70969034307688403)
,p_name=>'P16_PASSWORD_RE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_api.id(132881822363997259)
,p_prompt=>unistr('Confirmar Contrase\00F1a')
,p_post_element_text=>'<span class="fa fa-eye" aria-hidden="true"></span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>10
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul>',
unistr('    <li>La contrase\00F1a debe tener al menos 5 caracteres y m\00E1ximo 10 caracteres.</li>  '),
'</ul>'))
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(70969975347688404)
,p_name=>'P16_CDGO_CLNTE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_api.id(132881822363997259)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70971056216688438)
,p_name=>'al soltar la tecla password'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_PASSWORD'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'($v(''P16_PASSWORD'') || ''1'')  === ($v(''P16_PASSWORD_RE'') || ''2'')'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70971526083688443)
,p_event_id=>wwv_flow_api.id(70971056216688438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(70966929270688374)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70972058506688447)
,p_event_id=>wwv_flow_api.id(70971056216688438)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(70966929270688374)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70973335724688448)
,p_name=>'al soltar la tecla password_re'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_PASSWORD_RE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'($v(''P16_PASSWORD'') || ''1'')  === ($v(''P16_PASSWORD_RE'') || ''2'')'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70973840628688450)
,p_event_id=>wwv_flow_api.id(70973335724688448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(70966929270688374)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70974396769688450)
,p_event_id=>wwv_flow_api.id(70973335724688448)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(70966929270688374)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70974838233688450)
,p_event_id=>wwv_flow_api.id(70973335724688448)
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
'        pageItem: "P16_PASSWORD_RE",',
unistr('        message: "Las contrase\00F1as no coinciden.",'),
'        unsafe: false',
'    }',
']);',
'$(''#t_Alert_Notification'').hide();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70975354669688450)
,p_event_id=>wwv_flow_api.id(70973335724688448)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.clearErrors();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70975716985688451)
,p_name=>unistr('al cambiar la nueva contrase\00F1a')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_PASSWORD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70976232193688451)
,p_event_id=>wwv_flow_api.id(70975716985688451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('//var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\005Cd)(?=.*[/*_.,:;@#!\00A1$%\00BF?&{}+])([A-Za-z\005Cd/*_.,:;@#!\00A1$%\00BF?&{}+]|[^ ]){5,20}$/;'),
'var regex = /^[\s\S]{5,10}$/;',
'',
'var pass = $v(''P16_PASSWORD'');',
'apex.message.clearErrors();',
'',
'if (!regex.test(pass)) {',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: ["page", "inline"],',
'            pageItem: "P16_PASSWORD",',
unistr('            message: "No se cumple con las condiciones minimas para una contrase\00F1a.",'),
'            unsafe: false',
'        }',
'    ]);',
'    $(''#t_Alert_Notification'').hide();',
'    document.getElementById(''P16_PASSWORD'').focus();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(70972498565688448)
,p_name=>'al obtener el foco'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P16_PASSWORD_RE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(70972986394688448)
,p_event_id=>wwv_flow_api.id(70972498565688448)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('//var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\005Cd)(?=.*[/*_.,:;@#!\00A1$%\00BF?&{}+])([A-Za-z\005Cd/*_.,:;@#!\00A1$%\00BF?&{}+]|[^ ]){5,20}$/;'),
'var regex = /^[\s\S]{5,10}$/;',
'var pass = $v(''P16_PASSWORD'');',
'if (!regex.test(pass)) {',
'    $(''#P16_PASSWORD'').focus();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70970386408688434)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'    v_body    json_object_t := json_object_t();',
'    ',
'    v_clob    clob;',
'begin',
'    v_body.put(''tercero_portal'', :P16_ID_TRCRO_PRTAL);',
'    v_body.put(''password''      , :P16_PASSWORD );',
'    v_body.put(''password_re''   , :P16_PASSWORD_RE);',
'    v_body.put(''accion''        , ''I'');',
'    ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'    ',
'    v_json := json_object_t(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''portal/confirmarRegistro'',',
'                                                               p_http_method  => ''POST'',',
'                                                               p_body         => v_body.stringify));',
'                                                               ',
'   ',
'    insert into muerto ( v_001, t_001) values (''Despues de llamr al servicio Confirmar registro'', systimestamp); commit;',
'    if (v_json.get_String(''type'') != ''OK'') then',
'         apex_error.add_error ( p_message          => v_json.get_String(''msg'') ,',
'                                p_display_location => apex_error.c_inline_in_notification);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(70966929270688374)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70496634256757224)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'restablecer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'    v_body    json_object_t := json_object_t();',
'begin',
'    v_body.put(''tercero''    , :P16_ID_TRCRO);',
'    v_body.put(''password''   , :P16_PASSWORD );',
'    v_body.put(''password_re'', :P16_PASSWORD_RE);',
'    v_body.put(''accion''     , ''R'');',
'    ',
'    ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'    v_json := json_object_t(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR_PRVDO || ''portal/confirmarRegistro'',',
'                                                               p_http_method  => ''POST'',',
'                                                               p_body         => v_body.stringify));',
'    ',
'    if (v_json.get_String(''type'') != ''OK'') then',
'         apex_error.add_error ( p_message          => v_json.get_String(''msg'') ,',
'                                p_display_location => apex_error.c_inline_in_notification);',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(70496523349757223)
,p_process_success_message=>unistr('Contrase\00F1a restablecida con \00E9xito!')
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(72097316500408745)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'borrar token'
,p_process_sql_clob=>':P16_TKEN := null;'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70970640755688437)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'fetch rows'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'    v_obj     json_object_t := json_object_t();    ',
'begin',
'    v_obj.put(''accion'', ''C'');',
'    v_obj.put(''tercero_portal'', :P16_ID_TRCRO_PRTAL);',
'    v_obj.put(''tercero'', :P16_ID_TRCRO);',
'    v_obj.put(''token''  , :P16_TKEN);',
'    ',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/json'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR || ''portal/confirmarRegistro'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_body         => v_obj.stringify));',
'    ',
'    :P16_CDGO_CLNTE  := v_json.get_String(''cliente'');',
'    :P16_TYPE        := v_json.get_String(''type'');',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
);
end;
/
