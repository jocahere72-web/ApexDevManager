prompt --application/shared_components/user_interface/lovs/lv_titulos_estados
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(8303390739225883)
,p_lov_name=>'LV_TITULOS_ESTADOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_ttlo_jdcial_estdo as r',
'  from gf_d_titulos_judicial_estdo',
' order by 1'))
);
end;
/
