prompt --application/shared_components/security/authentications/autenticación_de_application_express
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(35960992919527997)
,p_name=>unistr('Autenticaci\00F3n de Application Express')
,p_scheme_type=>'NATIVE_APEX_ACCOUNTS'
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
