prompt --application/shared_components/user_interface/lovs/lv_up_envios
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(8141617523690866)
,p_lov_name=>'LV_UP_ENVIOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select object_name || '' version '' || overload d,  ',
'	   object_name r',
'from user_arguments ',
'where package_name = ''PKG_MA_ENVIOS_MEDIO''',
'and argument_name is not null',
'group by object_name,overload',
'order by 1'))
);
end;
/
