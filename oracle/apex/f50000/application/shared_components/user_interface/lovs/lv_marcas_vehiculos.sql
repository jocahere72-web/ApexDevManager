prompt --application/shared_components/user_interface/lovs/lv_marcas_vehiculos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(97172682668005310)
,p_lov_name=>'LV_MARCAS_VEHICULOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_vhclo_mrca as d,',
'       cdgo_vhclo_mrca  as r',
'  from df_s_vehiculos_marca',
' order by 1'))
);
end;
/
