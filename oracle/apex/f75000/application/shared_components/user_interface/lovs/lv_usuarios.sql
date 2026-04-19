prompt --application/shared_components/user_interface/lovs/lv_usuarios
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(171440503040652775)
,p_lov_name=>'LV_USUARIOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_trcro d, id_usrio r ',
'from v_sg_g_usuarios',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      actvo = ''S''',
'order by 1'))
);
end;
/
