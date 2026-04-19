prompt --application/shared_components/user_interface/lovs/lv_nombre_tablas
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(168541067372021256)
,p_lov_name=>'LV_NOMBRE_TABLAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select table_name as d,',
'       table_name as r',
'  from user_tables ',
' order by 1'))
);
end;
/
