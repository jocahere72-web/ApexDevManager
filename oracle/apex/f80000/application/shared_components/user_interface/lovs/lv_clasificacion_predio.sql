prompt --application/shared_components/user_interface/lovs/lv_clasificacion_predio
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(30505087436463315)
,p_lov_name=>'LV_CLASIFICACION_PREDIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_prdio_clsfccion d,',
'       cdgo_prdio_clsfccion  r   ',
'  from df_s_predios_clasificacion',
'  order by cdgo_prdio_clsfccion'))
);
end;
/
