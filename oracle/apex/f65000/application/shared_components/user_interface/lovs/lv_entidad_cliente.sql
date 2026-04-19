prompt --application/shared_components/user_interface/lovs/lv_entidad_cliente
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(40347846841560124)
,p_lov_name=>'LV_ENTIDAD_CLIENTE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_entdad||'' - ''||dscrpcion d, id_entdad_clnte r ',
'from v_nt_d_entidad_cliente',
'where cdgo_clnte = :F_CDGO_CLNTE',
'order by 1'))
);
end;
/
