prompt --application/shared_components/user_interface/lovs/lv_envios_consultas
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(12733916065371752)
,p_lov_name=>'LV_ENVIOS_CONSULTAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_envio_prgrmdo_cnslta r',
'from ma_g_envios_prgrmdo_cnslta',
'where id_envio_prgrmdo = :P11_ID_ENVIO_PRGRMDO',
'order by 1'))
);
end;
/
