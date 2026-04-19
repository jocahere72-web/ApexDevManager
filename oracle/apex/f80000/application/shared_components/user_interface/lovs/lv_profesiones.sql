prompt --application/shared_components/user_interface/lovs/lv_profesiones
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30517483710463320)
,p_lov_name=>'LV_PROFESIONES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_prfsion as d,',
'       id_prfsion as r',
'  from df_s_profesiones',
' order by 1'))
);
end;
/
