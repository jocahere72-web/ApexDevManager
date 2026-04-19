prompt --application/pages/page_00035
begin
wwv_flow_api.create_page(
 p_id=>35
,p_user_interface_id=>wwv_flow_api.id(95249231080808714)
,p_name=>'Login Page'
,p_step_title=>'Login Page'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'span.t-Login-logo {',
'border-radius : 10px; ',
'background-repeat: no-repeat;',
'--background: url(#WORKSPACE_IMAGES#Logo_SIAC_copi.ico);',
'background : url(#WORKSPACE_IMAGES#Logo_Transparente.ico);',
'width : 250px;',
'height : 105px;',
'}',
'',
'.t-PageBody--login .t-Body {',
'background: url(#WORKSPACE_IMAGES#Distrito_Riohacha_copi.png);',
'background-repeat: no-repeat;',
'background-size: auto;',
'--width :100%;',
'--height :100%;',
'}',
'',
'.t-Login-region {',
'  position: relative;',
'  width: 410px;',
'  margin: 0 auto;',
'  background: rgba(226, 226, 226, 0.3);',
'  padding: 20px 22px;',
'  --border: 1px solid;',
'  border-top-color: rgba(255,255,255,.4);',
'  border-left-color: rgba(255,255,255,.4);',
'  border-bottom-color: rgba(60,60,60,.4);',
'  border-right-color: rgba(60,60,60,.4);',
'  border-radius : 10px; ',
'}',
''))
,p_step_template=>wwv_flow_api.id(29511870460068489)
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_last_updated_by=>'ADMIN'
,p_last_upd_yyyymmddhh24miss=>'20180918161352'
);
wwv_flow_api.create_page_plug(
 p_id=>wwv_flow_api.id(692795573766847786)
,p_plug_name=>unistr('<h4><center><font face="Century Gothic">SISTEMA DE INFORMACI\00D3N PARA LA ADMINISTRACI\00D3N DE COMPARENDOS</font></center></h4>')
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_api.id(29552078926068507)
,p_plug_display_sequence=>10
,p_plug_display_point=>'BODY'
,p_plug_query_options=>'DERIVED_REPORT_COLUMNS'
,p_attribute_01=>'N'
,p_attribute_02=>'TEXT'
,p_attribute_03=>'Y'
);
wwv_flow_api.create_page_button(
 p_id=>wwv_flow_api.id(146705044888434331)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_api.id(692795573766847786)
,p_button_name=>'LOGIN'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_api.id(29604648415068538)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Ingresar'
,p_button_position=>'REGION_TEMPLATE_CREATE'
,p_grid_new_grid=>false
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146705419001434350)
,p_name=>'P35_CDGO_CLNTE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_api.id(692795573766847786)
,p_prompt=>'Cliente'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte, ',
'       cdgo_clnte ',
'  from v_df_s_clientes ',
'order by nmbre_clnte'))
,p_cHeight=>1
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attribute_01=>'NONE'
,p_attribute_02=>'N'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146705793729434369)
,p_name=>'P35_USERNAME'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_api.id(692795573766847786)
,p_prompt=>'Usuario'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_css_classes=>'icon-login-username'
,p_item_template_options=>'#DEFAULT#'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'NONE'
);
wwv_flow_api.create_page_item(
 p_id=>wwv_flow_api.id(146706151478434369)
,p_name=>'P35_PASSWORD'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_api.id(692795573766847786)
,p_prompt=>'Clave'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_field_template=>wwv_flow_api.id(29603993160068537)
,p_item_css_classes=>'icon-login-password'
,p_item_template_options=>'#DEFAULT#'
,p_inline_help_text=>unistr('<center style="color:#485a9b">Inicie sesi\00F3n para ayudarle en su gesti\00F3n</center>')
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(146706658078434408)
,p_validation_name=>unistr('Validaci\00F3n Usuario Valido')
,p_validation_sequence=>10
,p_validation=>'P35_USERNAME'
,p_validation_type=>'ITEM_IS_NUMERIC'
,p_error_message=>'Usuario no Valido'
,p_associated_item=>wwv_flow_api.id(146705793729434369)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_validation(
 p_id=>wwv_flow_api.id(146707003959434412)
,p_validation_name=>'Validar si Existe Usuario'
,p_validation_sequence=>20
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select user_name ',
'  from sg_g_usuarios ',
' where cdgo_clnte = :P35_CDGO_CLNTE',
'   and user_name = :P35_USERNAME'))
,p_validation_type=>'EXISTS'
,p_error_message=>'El usuario no Existe'
,p_associated_item=>wwv_flow_api.id(146705793729434369)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(146707730541434414)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Username Cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.send_login_username_cookie (',
'    p_username => lower(:P35_USERNAME) );'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(146707354375434412)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P35_USERNAME,',
'    p_password => :P35_PASSWORD || ''|'' || :P35_CDGO_CLNTE);',
'    ',
':F_CDGO_CLNTE:= :P35_CDGO_CLNTE;',
'',
'select a.id_pais,',
'        (select cdgo_pais from df_s_paises m where m.id_pais = a.id_pais) cdgo_pais,',
'        a.id_dprtmnto,',
'        (select cdgo_dprtmnto from df_s_departamentos m where m.id_dprtmnto = a.id_dprtmnto) cdgo_dprtmnto,',
'        a.id_mncpio,',
'        substr((select cdgo_mncpio from df_s_municipios m where m.id_mncpio = a.id_mncpio),3) cdgo_mncpio',
'    into :F_ID_PAIS_CLNTE, :F_CDGO_PAIS_CLNTE, :F_ID_DPRTMNTO_CLNTE, :F_CDGO_DPRTMNTO_CLNTE, :F_ID_MNCPIO_CLNTE, :F_CDGO_MNCPIO_CLNTE',
'  from df_s_clientes  a',
'where cdgo_clnte = :P35_CDGO_CLNTE;',
'',
'select nmbre_trcro, id_trcro ',
'  INTO :F_NMBRE_USRIO, :F_ID_TRCRO ',
'  from V_SG_G_USUARIOS ',
' where user_name = :P35_USERNAME ',
'   and cdgo_clnte = :P35_CDGO_CLNTE;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(146708503118434414)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(146708180653434414)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_process_sql_clob=>':P35_USERNAME := apex_authentication.get_login_username_cookie;'
);
end;
/
