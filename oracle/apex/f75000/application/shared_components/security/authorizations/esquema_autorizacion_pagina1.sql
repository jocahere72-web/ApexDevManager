prompt --application/shared_components/security/authorizations/esquema_autorizacion_pagina1
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(95709583681458922)
,p_name=>'Esquema_autorizacion_pagina1'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_sg_autorizacion.fnc_valida_pagina_x_usuario(:F_CDGO_CLNTE, :APP_USER, :APP_ID,:APP_PAGE_ID );'
,p_error_message=>unistr('Se\00F1or(a) &F_NMBRE_USRIO., Usted no tiene privilegios sobre esta opci\00F3n.')
,p_caching=>'NOCACHE'
);
end;
/
