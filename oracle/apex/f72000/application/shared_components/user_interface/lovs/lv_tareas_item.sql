prompt --application/shared_components/user_interface/lovs/lv_tareas_item
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(107872917490285880)
,p_lov_name=>'LV_TAREAS_ITEM'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion d, id_trea_item r ',
'from gj_d_tareas_item',
'where actvo = ''S''',
'order by 1'))
);
end;
/
