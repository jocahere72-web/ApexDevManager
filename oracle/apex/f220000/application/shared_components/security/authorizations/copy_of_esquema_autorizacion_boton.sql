prompt --application/shared_components/security/authorizations/copy_of_esquema_autorizacion_boton
begin
wwv_flow_api.create_security_scheme(
 p_id=>wwv_flow_api.id(3698400146745519)
,p_name=>'Copy of Esquema_autorizacion_boton'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return pkg_sg_autorizacion.fnc_valida_boton_x_usuario(:F_CDGO_CLNTE,:APP_USER, :APP_ID,:APP_PAGE_ID,:APP_COMPONENT_NAME);'
,p_error_message=>'No tienes permisos'
,p_reference_id=>99268244733773812
,p_caching=>'NOCACHE'
);
end;
/
