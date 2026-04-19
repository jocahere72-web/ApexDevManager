prompt --application/shared_components/user_interface/lovs/lv_usuarios
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(2326495196380596)
,p_lov_name=>'LV_USUARIOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro || ''['' || user_name || '']''  as d,',
'       id_usrio as r',
'  from v_sg_g_usuarios',
' order by 1'))
);
end;
/
