prompt --application/pages/page_00101
begin
wwv_flow_api.create_page(
 p_id=>101
,p_user_interface_id=>wwv_flow_api.id(304917555609291792)
,p_name=>'Login Page'
,p_alias=>'LOGIN_DESKTOP'
,p_step_title=>'Login Page'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-PageBody--login .t-Body {',
'background: url(#WORKSPACE_IMAGES#Fondo_Infor_01.jpg);',
'background-repeat: no-repeat;',
'background-size: 100% auto;',
'',
'}'))
,p_step_template=>wwv_flow_api.id(304867358519291482)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'SROMERO'
,p_last_upd_yyyymmddhh24miss=>'20180201095526'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(309267003512449246)
,p_plug_name=>unistr('Autenticaci\00F3n')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(304883719795291570)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(103898974832718390)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(309267003512449246)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(304906721670291639)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Log In'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103899400104718401)
,p_name=>'P101_CDGO_CLNTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(309267003512449246)
,p_prompt=>'Cliente'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte, ',
'       cdgo_clnte ',
'  from v_df_s_clientes ',
'order by nmbre_clnte'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(304906191676291628)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103899667131718404)
,p_name=>'P101_USERNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(309267003512449246)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(304906191676291628)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(103900019049718404)
,p_name=>'P101_PASSWORD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(309267003512449246)
,p_prompt=>'Clave'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(304906191676291628)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103900601891718416)
,p_validation_name=>unistr('Validaci\00F3n Usuario Valido')
,p_validation_sequence=>10
,p_validation=>'P101_USERNAME'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'Usuario no Valido'
,p_always_execute=>'Y'
,p_associated_item=>wwv_flow_api.id(103899667131718404)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(103900983020718425)
,p_validation_name=>'Validar si Existe Usuario'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select user_name ',
'  from sg_g_usuarios ',
' where cdgo_clnte = :P101_CDGO_CLNTE',
'   and user_name = :P101_USERNAME'))
,p_validation_type=>'EXISTS'
,p_error_message=>'El usuario no Existe'
,p_always_execute=>'Y'
,p_validation_condition=>'P101_USERNAME'
,p_validation_condition_type=>'ITEM_IS_NUMERIC'
,p_associated_item=>wwv_flow_api.id(103899667131718404)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103901694949718426)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P101_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103901229301718426)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P101_USERNAME,',
'    p_password => :P101_PASSWORD || ''|'' || :P101_CDGO_CLNTE);',
'    ',
':F_CDGO_CLNTE:= :P101_CDGO_CLNTE;',
'select nmbre_trcro INTO :F_NMBRE_USRIO from V_SG_G_USUARIOS where user_name = :P101_USERNAME;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103902446369718427)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(103902041295718427)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P101_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
