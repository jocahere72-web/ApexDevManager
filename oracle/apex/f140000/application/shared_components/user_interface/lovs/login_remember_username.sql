prompt --application/shared_components/user_interface/lovs/login_remember_username
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(22513536875661111)
,p_lov_name=>'LOGIN_REMEMBER_USERNAME'
,p_lov_query=>'.'||wwv_flow_api.id(22513536875661111)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(22513903960661131)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Recordar nombre de usuario'
,p_lov_return_value=>'Y'
);
end;
/
