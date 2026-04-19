prompt --application/shared_components/user_interface/lovs/lv_transmision_vehiculo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87294298445088657)
,p_lov_name=>'LV_TRANSMISION_VEHICULO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhclo_trnsmsion as d',
'     , cdgo_vhclo_trnsmsion      as r',
'  from df_s_vehiculos_transmision',
' order by 1'))
);
end;
/
