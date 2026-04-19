prompt --application/shared_components/security/authentications/sin_autenticación
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(197944845079250204)
,p_name=>unistr('Sin Autenticaci\00F3n')
,p_scheme_type=>'NATIVE_DAD'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
