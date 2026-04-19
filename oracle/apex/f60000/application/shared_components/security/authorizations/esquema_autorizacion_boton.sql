prompt --application/shared_components/security/authorizations/esquema_autorizacion_boton
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(103270000064132845)
,p_name=>'Esquema_autorizacion_boton'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_sg_autorizacion.fnc_valida_boton_x_usuario(:F_CDGO_CLNTE,:APP_USER, :APP_ID,:APP_PAGE_ID,:APP_COMPONENT_NAME);'
,p_error_message=>'No tienes permisos'
,p_caching=>'NOCACHE'
);
end;
/
