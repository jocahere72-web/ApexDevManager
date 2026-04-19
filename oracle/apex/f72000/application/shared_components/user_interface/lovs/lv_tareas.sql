prompt --application/shared_components/user_interface/lovs/lv_tareas
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(107805909129135187)
,p_lov_name=>'LV_TAREAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trea d, id_trea r ',
'from wf_d_tareas',
'order by 1'))
);
end;
/
