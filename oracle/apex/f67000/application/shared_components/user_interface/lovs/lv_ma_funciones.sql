prompt --application/shared_components/user_interface/lovs/lv_ma_funciones
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(5840657949868755)
,p_lov_name=>'LV_MA_FUNCIONES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name || '' version '' || overload d,  ',
'	   object_name r',
'from user_arguments ',
'where package_name = ''PKG_MA_FUNCIONES''',
'and argument_name is not null',
'group by object_name,overload',
'order by 1'))
);
end;
/
