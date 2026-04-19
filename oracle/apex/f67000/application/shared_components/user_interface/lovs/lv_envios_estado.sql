prompt --application/shared_components/user_interface/lovs/lv_envios_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(8815971980052428)
,p_lov_name=>'LV_ENVIOS_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, cdgo_envio_estdo r',
'from ma_d_envios_estado',
'where actvo = ''S''',
'order by 1'))
);
end;
/
