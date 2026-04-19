prompt --application/shared_components/user_interface/lovs/lv_clientes
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(36009174230034813)
,p_lov_name=>'LV_CLIENTES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_clnte D,',
'       cdgo_clnte R',
'  from df_s_clientes',
' order by 1'))
);
end;
/
