prompt --application/shared_components/user_interface/lovs/lv_ajustes_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(37939004592994450)
,p_lov_name=>'LV_AJUSTES_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'     dscrpcion as d,',
'     cdgo_ajste_estdo as r',
'from gf_d_ajuste_estado',
'where cdgo_ajste_estdo in (select distinct cdgo_ajste_estdo from gf_g_ajustes)',
' order by 1'))
);
end;
/
