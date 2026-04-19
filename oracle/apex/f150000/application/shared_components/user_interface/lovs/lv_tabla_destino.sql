prompt --application/shared_components/user_interface/lovs/lv_tabla_destino
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(157843772732320742)
,p_lov_name=>'LV_TABLA_DESTINO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select table_name as d,',
'       table_name as r',
'  from user_tables ',
' order by 1'))
);
end;
/
