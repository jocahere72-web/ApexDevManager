prompt --application/shared_components/user_interface/lovs/lv_tareas
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(323683273961283888)
,p_lov_name=>'LV_TAREAS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_trea as d,',
'       id_trea as r',
'  from v_wf_d_tareas',
'--where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
