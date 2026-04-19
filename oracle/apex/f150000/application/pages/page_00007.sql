prompt --application/pages/page_00007
begin
wwv_flow_api.create_page(
 p_id=>7
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Impuestos'
,p_step_title=>'Impuestos'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.js',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/js/tooltipster.bundle.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/emisionRecibo.js',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/app.js'))
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
'',
'    if ($v(''P7_TYPE'') === ''ERROR'') {',
'       $(''#rgion_pass_heading'').parents(''.t-Login-region'').hide()',
'        Swal.fire({',
unistr('            title: ''Informaci\00F3n'','),
unistr('            html: `<h6>Ya se proceso la informaci\00F3n por favor ingrese por el portal ciudadano.</h6>`,'),
'            icon: ''info'',',
'            allowEscapeKey: false,',
'            allowOutsideClick: false,',
'            allowEnterKey: false',
'        }).then((result) => {',
'            window.location.href = ''f?p=150000:LOGIN_DESKTOP::::LOGIN_DESKTOP:F_CDGO_CLNTE:6''',
'        });',
'    }',
'',
'});'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/sweetalert2/sweetalert2.min.css',
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/css/tooltipster.bundle.min.css',
'https://fonts.googleapis.com/css?family=Roboto:400,500,900,700,100italic,300italic,400italic,500italic,700italic,900italic,300,100',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/impuestos.css',
'#IMAGE_PREFIX#javascript/infortributos/Portal/css/menu.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Login-header{',
'    display:none;',
'}',
'',
'.t-Form-itemWrapper > .t-Form-itemText {',
'    margin-left: 4px !important;',
'    margin-top: 4px !important;',
'    cursor: pointer !important;',
'} '))
,p_step_template=>wwv_flow_api.id(252162518438651337)
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'HMARTINEZ'
,p_last_upd_yyyymmddhh24miss=>'20200813091654'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(61915481530308901)
,p_plug_name=>unistr('Crear contrase\00F1a')
,p_region_name=>'rgion_pass'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178893500651396)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'HTML'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(61139390808039405)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_api.id(61915481530308901)
,p_button_name=>'btn_crear'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(252201929979651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('Crear Contrase\00F1a')
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-save'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61139129790039403)
,p_name=>'P7_PASSWORD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(61915481530308901)
,p_prompt=>unistr('Nueva Contrase\00F1a')
,p_placeholder=>'Ejemplo oNQZnz$Hx2.'
,p_post_element_text=>'<span class="fa fa-eye" aria-hidden="true"></span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>20
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('La contrase\00F1a debe tener al menos 8 caracteres y m\00E1ximo 20 caracteres.<br/>'),
unistr('La contrase\00F1a debe contener letras may\00FAsculas y min\00FAsculas, n\00FAmeros y caracteres especiales.<br/>'),
unistr('Los caracteres permitido son: / * _ . , : ; @ # ! \00A1 $ % \00BF ? & { } + <br/>'),
'Por ejemplo: oNQZnz$Hx2.'))
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61139212949039404)
,p_name=>'P7_PASSWORD_RE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(61915481530308901)
,p_prompt=>unistr('Confirmar Contrase\00F1a')
,p_placeholder=>'Ejemplo oNQZnz$Hx2.'
,p_post_element_text=>'<span class="fa fa-eye" aria-hidden="true"></span>'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>30
,p_cMaxlength=>20
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('La contrase\00F1a debe tener al menos 8 caracteres y m\00E1ximo 20 caracteres.<br/>'),
unistr('La contrase\00F1a debe contener letras may\00FAsculas y min\00FAsculas, n\00FAmeros y caracteres especiales.<br/>'),
unistr('Los caracteres permitido son: / * _ . , : ; @ # ! \00A1 $ % \00BF ? & { } + <br/>'),
'Por ejemplo: oNQZnz$Hx2.'))
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61141544810039427)
,p_name=>'P7_CDGO_CLNTE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(61915481530308901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61142253393039434)
,p_name=>'P7_TYPE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(61915481530308901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(61915518310308902)
,p_name=>'P7_ID_TRCRO_PRTAL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(61915481530308901)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61139420543039406)
,p_name=>'al soltar la tecla password'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_PASSWORD'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'($v(''P7_PASSWORD'') || ''1'')  === ($v(''P7_PASSWORD_RE'') || ''2'')'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61139543496039407)
,p_event_id=>wwv_flow_api.id(61139420543039406)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(61139390808039405)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61139659679039408)
,p_event_id=>wwv_flow_api.id(61139420543039406)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(61139390808039405)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61140869013039420)
,p_name=>'al soltar la tecla password_re'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_PASSWORD_RE'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'($v(''P7_PASSWORD'') || ''1'')  === ($v(''P7_PASSWORD_RE'') || ''2'')'
,p_bind_type=>'bind'
,p_bind_event_type=>'keyup'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61140966443039421)
,p_event_id=>wwv_flow_api.id(61140869013039420)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(61139390808039405)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61141004254039422)
,p_event_id=>wwv_flow_api.id(61140869013039420)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_api.id(61139390808039405)
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61141128573039423)
,p_event_id=>wwv_flow_api.id(61140869013039420)
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
'        pageItem: "P7_PASSWORD_RE",',
unistr('        message: "Las contrase\00F1as no coinciden.",'),
'        unsafe: false',
'    }',
']);',
'$(''#t_Alert_Notification'').hide();'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61141226247039424)
,p_event_id=>wwv_flow_api.id(61140869013039420)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.clearErrors();'
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61139748725039409)
,p_name=>unistr('al cambiar la nueva contrase\00F1a')
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_PASSWORD'
,p_bind_type=>'bind'
,p_bind_event_type=>'change'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61139890731039410)
,p_event_id=>wwv_flow_api.id(61139748725039409)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\005Cd)(?=.*[/*_.,:;@#!\00A1$%\00BF?&{}+])([A-Za-z\005Cd/*_.,:;@#!\00A1$%\00BF?&{}+]|[^ ]){8,20}$/;'),
'',
'var pass = $v(''P7_PASSWORD'');',
'apex.message.clearErrors();',
'',
'if (!regex.test(pass)) {',
'    apex.message.showErrors([',
'        {',
'            type: "error",',
'            location: ["page", "inline"],',
'            pageItem: "P7_PASSWORD",',
unistr('            message: "No se cumple con las condiciones minimas para una contrase\00F1a.",'),
'            unsafe: false',
'        }',
'    ]);',
'    $(''#t_Alert_Notification'').hide();',
'    document.getElementById(''P7_PASSWORD'').focus();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_da_event(
 p_id=>wwv_flow_api.id(61140332876039415)
,p_name=>'al obtener el foco'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P7_PASSWORD_RE'
,p_bind_type=>'bind'
,p_bind_event_type=>'focusin'
);
wwv_flow_api.create_page_da_action(
 p_id=>wwv_flow_api.id(61140402284039416)
,p_event_id=>wwv_flow_api.id(61140332876039415)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('var regex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\005Cd)(?=.*[/*_.,:;@#!\00A1$%\00BF?&{}+])([A-Za-z\005Cd/*_.,:;@#!\00A1$%\00BF?&{}+]|[^ ]){8,20}$/;'),
'var pass = $v(''P7_PASSWORD'');',
'if (!regex.test(pass)) {',
'    $(''#P7_PASSWORD'').focus();',
'}'))
,p_stop_execution_on_error=>'Y'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(61140072273039412)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'registrar'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR || ''portal/confirmarRegistro'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_string.string_to_table(''tercero:password:password_re'', '':''),',
'                                                                     p_parm_value   => apex_string.string_to_table(:P7_ID_TRCRO_PRTAL || ''~#~'' || :P7_PASSWORD || ''~#~'' || :P7_PASSWORD_RE, ''~#~'')));',
'    ',
'    if (v_json.get_String(''type'') != ''OK'') then',
'        raise_application_error(-20001, v_json.get_String(''msg''));',
'    end if;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_api.id(61139390808039405)
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(61142145020039433)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'fetch rows'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_json    json_object_t;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => :F_DRCCION_SRVDOR || ',
'                                                                     ''portal/confirmarRegistro'',',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_string.string_to_table(''tercero:accion'', '':''),',
'                                                                     p_parm_value   => apex_string.string_to_table(''101''|| '':C'', '':'')));',
'    ',
'    :P7_CDGO_CLNTE  := v_json.get_String(''cliente'');',
'    :P7_TYPE        := v_json.get_String(''type'');',
'exception',
'    when others then',
'        null;',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
