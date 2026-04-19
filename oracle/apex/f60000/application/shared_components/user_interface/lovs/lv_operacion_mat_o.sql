prompt --application/shared_components/user_interface/lovs/lv_operacion_mat_o
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103267457014132832)
,p_lov_name=>'LV_OPERACION_MAT(+ O -)'
,p_lov_query=>'.'||wwv_flow_api.id(103267457014132832)||'.'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(103267519313132832)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Suma'
,p_lov_return_value=>'+'
);
wwv_flow_api.create_static_lov_data(
 p_id=>wwv_flow_api.id(103267647922132836)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Resta'
,p_lov_return_value=>'-'
);
end;
/
