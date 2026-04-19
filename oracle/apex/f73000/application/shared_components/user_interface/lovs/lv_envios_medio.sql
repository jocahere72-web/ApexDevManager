prompt --application/shared_components/user_interface/lovs/lv_envios_medio
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(8949116249892756)
,p_lov_name=>'LV_ENVIOS_MEDIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, cdgo_envio_mdio r',
'from ma_d_envios_medio',
'where actvo = ''S''',
'order by 1'))
);
end;
/
