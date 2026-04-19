prompt --application/shared_components/user_interface/lovs/lv_grupo_vehiculos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(98646131460007759)
,p_lov_name=>'LV_GRUPO_VEHICULOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT GRPO d,',
'       GRPO r',
'  from DF_S_VEHICULOS_GRUPO',
' order by GRPO'))
);
end;
/
