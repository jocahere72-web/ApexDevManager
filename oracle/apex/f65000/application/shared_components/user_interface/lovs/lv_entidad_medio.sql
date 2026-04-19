prompt --application/shared_components/user_interface/lovs/lv_entidad_medio
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(40960237943483470)
,p_lov_name=>'LV_ENTIDAD_MEDIO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion_entdad as d,',
'       id_entdad_clnte_mdio as r',
'  from v_nt_d_ntfccion_mdio_entdd',
' order by 2'))
);
end;
/
