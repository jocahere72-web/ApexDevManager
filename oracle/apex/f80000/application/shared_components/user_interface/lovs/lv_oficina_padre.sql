prompt --application/shared_components/user_interface/lovs/lv_oficina_padre
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30514270771463318)
,p_lov_name=>'LV_OFICINA_PADRE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select NMBRE_OFCNA as d,',
'       ID_OFCNA_pdre	 as r',
'  from DF_C_OFICINAS',
' order by 1'))
);
end;
/
