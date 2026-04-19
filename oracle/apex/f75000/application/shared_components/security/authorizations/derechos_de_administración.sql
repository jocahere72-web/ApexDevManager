prompt --application/shared_components/security/authorizations/derechos_de_administración
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(237320917472524264)
,p_name=>unistr('Derechos de administraci\00F3n')
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return true;'
,p_error_message=>'Privilegios insuficientes. El usuario no es administrador.'
,p_caching=>'BY_USER_BY_PAGE_VIEW'
);
end;
/
