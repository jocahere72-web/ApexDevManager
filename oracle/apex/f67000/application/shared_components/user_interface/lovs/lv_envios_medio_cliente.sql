prompt --application/shared_components/user_interface/lovs/lv_envios_medio_cliente
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5663954043786569)
,p_lov_name=>'LV_ENVIOS_MEDIO_CLIENTE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dscrpcion d, a.cdgo_envio_mdio r',
'from ma_d_envios_medio a',
'where a.actvo = ''S'' and',
'      a.cdgo_envio_mdio in(select b.cdgo_envio_mdio ',
'                           from ma_d_envios_medio_cnfgrcion b ',
'                           where b.cdgo_clnte   = :F_CDGO_CLNTE and  ',
'                                 b.actvo        = ''S'')',
'order by 1'))
);
end;
/
