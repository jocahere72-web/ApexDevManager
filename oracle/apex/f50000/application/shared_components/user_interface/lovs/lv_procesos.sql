prompt --application/shared_components/user_interface/lovs/lv_procesos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(49445067203499395)
,p_lov_name=>'LV_PROCESOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion  as d,',
'       id_prcso  as r',
'  from df_s_procesos',
'    where actvo=''S''',
' order by 1'))
);
end;
/
