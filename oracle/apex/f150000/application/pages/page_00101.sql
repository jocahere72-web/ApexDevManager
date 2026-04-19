prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(252212713032651535)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'Login Page'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/js/tooltipster.bundle.js?v=&APP_SESSION.',
'#IMAGE_PREFIX#javascript/infortributos/Portal/js/capsLock.js?v=&APP_SESSION.'))
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'async function olvido(){        ',
'    var rs = await apex.server.process(''url'');',
'    window.location.href = rs.url;',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.item(''RECUPERAR'').hide();',
'$(`<br/><center><a href="`+apex.item( "P101_LNK_TRMNOS_Y_CNDCNES" ).getValue()+`" target="_blank">Terminos y condiciones</a></center>`).appendTo($(''#BTN_RGSTRO'').parent())',
'capsLock.init(''.t-Login-region'');',
'//$(`<br/><center><a href="http://www.valledupar-cesar.gov.co/Paginas/Politicas-de-privacidad-y-condiciones-de-uso.aspx" target="_blank">Terminos y condiciones</a></center>`).appendTo($(''#BTN_RGSTRO'').parent())'))
,p_css_file_urls=>'#IMAGE_PREFIX#javascript/infortributos/Vendor/tooltipster/dist/css/tooltipster.bundle.min.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'span.t-Login-logo {',
'border-radius : 10px; ',
'background-repeat: no-repeat;',
'background : url(#APP_IMAGES#Logo_Transparente_tax.png);',
'width : 346px;',
'height : 208px;',
'}',
'',
'.t-Login-region {',
'  width: 100%;',
'  margin: 0 auto;',
'  background: rgba(226, 226, 226, 0.95);',
'  padding: 20px 22px;',
' -- border: 1px solid;',
'  border-top-color: rgba(255,255,255,.4);',
'  border-left-color: rgba(255,255,255,.4);',
'  border-bottom-color: rgba(60,60,60,.4);',
'  border-right-color: rgba(60,60,60,.4);',
'  border-radius : 10px; ',
'}',
'',
'div.t-Body{        ',
'   background: url(#WORKSPACE_IMAGES#Fondo_Login.jpg) no-repeat center center fixed; ',
'  -webkit-background-size: cover;',
'  -moz-background-size: cover;',
'  -o-background-size: cover;',
'  background-size: cover;',
'}',
''))
,p_step_template=>wwv_flow_api.id(252162518438651337)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'JLUJAN'
,p_last_upd_yyyymmddhh24miss=>'20250712180808'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(363592879402488070)
,p_plug_name=>'<p></p>'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(252178893500651396)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(158224823767757230)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_api.id(363592879402488070)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_is_hot=>'Y'
,p_button_image_alt=>unistr('INICIAR SESI\00D3N')
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_icon_css_classes=>'fa-user'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(59523770787410001)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(363592879402488070)
,p_button_name=>'BTN_RGSTRO'
,p_button_static_id=>'BTN_RGSTRO'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>wwv_flow_api.id(252202042199651469)
,p_button_image_alt=>'REGISTRARME'
,p_button_position=>'REGION_TEMPLATE_NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:P9_CDGO_CLNTE:&P101_CDGO_CLNTE.'
,p_icon_css_classes=>'fa-user-plus'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(4085768581494701)
,p_name=>'P101_LNK_TRMNOS_Y_CNDCNES'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_api.id(363592879402488070)
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(158225268116757241)
,p_name=>'P101_CDGO_CLNTE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(363592879402488070)
,p_item_default=>'F_CDGO_CLNTE'
,p_item_default_type=>'ITEM'
,p_display_as=>'NATIVE_HIDDEN'
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(158225670499757243)
,p_name=>'P101_USERNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(363592879402488070)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(158226054008757243)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_api.id(363592879402488070)
,p_prompt=>'Clave'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(252201703471651458)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_inline_help_text=>unistr('<center><a href="javascript:olvido()">\00BFOlvido su contrase\00F1a?</a></center>')
,p_attribute_01=>'Y'
);
wwv_flow_api.create_page_computation(
 p_id=>wwv_flow_api.id(4085898572494702)
,p_computation_sequence=>10
,p_computation_item=>'P101_LNK_TRMNOS_Y_CNDCNES'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select link_trmnos_cndcnes',
'   from df_s_clientes',
'  where cdgo_clnte = :F_CDGO_CLNTE;'))
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(158226505288757255)
,p_validation_name=>unistr('Validaci\00F3n Usuario Valido')
,p_validation_sequence=>10
,p_validation=>'P101_USERNAME'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'Usuario no Valido'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(158225670499757243)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(158227505643757258)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(158227125067757258)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>'apex_authentication.login( p_username => :P101_USERNAME, p_password => :P101_PASSWORD);'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(158228364063757259)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(158227915215757258)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(70497256978757230)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'url'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'apex_json.write(''type'', ''OK'');',
'apex_json.write(''url'', apex_util.prepare_url( p_url => ''f?p='' || :APP_ID || '':17:''||:APP_SESSION||''::no:::''));',
'apex_json.close_object;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
