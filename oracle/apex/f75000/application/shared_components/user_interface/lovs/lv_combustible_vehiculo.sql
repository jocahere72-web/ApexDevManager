prompt --application/shared_components/user_interface/lovs/lv_combustible_vehiculo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(87290652941057487)
,p_lov_name=>'LV_COMBUSTIBLE_VEHICULO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_vhculo_cmbstble as d',
'     , cdgo_vhclo_cmbstble       as r',
'  from df_s_vehiculos_combustible',
' order by 1'))
);
end;
/
