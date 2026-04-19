prompt --application/shared_components/user_interface/lovs/lv_categoria_vehiculo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(177367662373050681)
,p_lov_name=>'LV_CATEGORIA_VEHICULO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_VHCLO_CTGTRIA as d,',
'       CDGO_VHCLO_CTGTRIA as r',
'  from DF_S_VEHICULOS_CATEGORIA',
' order by 1'))
);
end;
/
