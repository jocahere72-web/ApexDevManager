prompt --application/shared_components/user_interface/lovs/lv_servicio_vehiculos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(103268541585132840)
,p_lov_name=>'LV_SERVICIO_VEHICULOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_SRVCIO  as d,',
'       CDGO_VHCLO_SRVCIO as r',
'  from DF_S_VEHICULOS_SERVICIO',
' order by 1'))
);
end;
/
