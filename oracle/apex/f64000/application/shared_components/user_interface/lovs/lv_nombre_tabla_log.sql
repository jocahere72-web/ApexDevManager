prompt --application/shared_components/user_interface/lovs/lv_nombre_tabla_log
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(104503272911273885)
,p_lov_name=>'LV_NOMBRE_TABLA_LOG'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TBLE_NME d ,',
'       TBLE_NME r ',
'from v_sg_g_manejos_error',
'order by 1'))
);
end;
/
