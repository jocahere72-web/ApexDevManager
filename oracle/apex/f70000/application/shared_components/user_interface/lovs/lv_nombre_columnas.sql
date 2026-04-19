prompt --application/shared_components/user_interface/lovs/lv_nombre_columnas
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(168553590184032282)
,p_lov_name=>'LV_NOMBRE_COLUMNAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select column_name d ,',
'      column_name r',
'from USER_TAB_COLUMNS'))
);
end;
/
