prompt --application/shared_components/user_interface/lovs/lv_areas_titulos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(9565111771029171)
,p_lov_name=>'LV_AREAS_TITULOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.nmbre_area as d,',
'       b.id_area as r',
'  from gf_d_titulos_judicial_area a',
'  join df_c_areas b on a.id_area = b.id_area',
' order by 1'))
);
end;
/
