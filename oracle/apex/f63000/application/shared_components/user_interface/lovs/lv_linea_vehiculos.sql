prompt --application/shared_components/user_interface/lovs/lv_linea_vehiculos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(201326973436427454)
,p_lov_name=>'LV_LINEA_VEHICULOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_LNEA as d,',
'       ID_VHCLO_LNEA as r',
'  from DF_S_VEHICULOS_LINEA',
' order by 1'))
);
end;
/
