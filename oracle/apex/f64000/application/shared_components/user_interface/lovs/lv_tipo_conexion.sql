prompt --application/shared_components/user_interface/lovs/lv_tipo_conexion
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(305212685571320650)
,p_lov_name=>'LV_TIPO_CONEXION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_CNXION_TPO d ,',
'       ID_CNXION_TPO r ',
'from MG_D_CONEXION_TIPO',
'order by 1'))
);
end;
/
