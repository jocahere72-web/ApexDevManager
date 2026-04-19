prompt --application/shared_components/user_interface/lovs/lv_tipo_variacion
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(83122861071351885)
,p_lov_name=>'LV_TIPO_VARIACION'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION_VHCLO_VRCION_TPO d ,',
'   CDGO_VHCLO_VRCION_TPO r ',
'from df_s_vehiculos_vrcion_tpo',
'order by 1'))
);
end;
/
