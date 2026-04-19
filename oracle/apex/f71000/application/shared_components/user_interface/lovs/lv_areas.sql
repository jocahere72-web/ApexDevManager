prompt --application/shared_components/user_interface/lovs/lv_areas
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9378643298073611)
,p_lov_name=>'LV_AREAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_area as d,',
'       id_area as r',
'  from df_c_areas',
' order by 1'))
);
end;
/
