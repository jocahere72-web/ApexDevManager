prompt --application/shared_components/security/authorizations/esquema_autorizacion_pagina
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(103270158884132846)
,p_name=>'Esquema_autorizacion_pagina'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_sg_autorizacion.fnc_valida_pagina_x_usuario(:F_CDGO_CLNTE, :APP_USER, :APP_ID,:APP_PAGE_ID );'
,p_error_message=>unistr('No tiene Autorizaci\00F3n')
,p_caching=>'NOCACHE'
);
end;
/
