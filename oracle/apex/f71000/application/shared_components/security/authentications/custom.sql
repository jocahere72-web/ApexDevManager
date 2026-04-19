prompt --application/shared_components/security/authentications/custom
begin
wwv_flow_api.create_authentication(
 p_id=>wwv_flow_api.id(177374767879050692)
,p_name=>'Custom'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attribute_03=>'pkg_sg_autenticacion.fnc_sg_autenticar'
,p_attribute_05=>'N'
,p_invalid_session_type=>'LOGIN'
,p_cookie_name=>'A1B2C3D4E5F6G7H8I9J10'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
);
end;
/
