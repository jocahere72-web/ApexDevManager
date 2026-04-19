prompt --application/shared_components/user_interface/lovs/lv_cnvnio_rvctria_estdo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(108324756049747353)
,p_lov_name=>'LV_CNVNIO_RVCTRIA_ESTDO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(dscrpcion) as d,',
'       cdgo_cnvnio_rvctria_estdo as r',
'  from gf_d_cnvnios_rvctria_estdo',
' order by 1;'))
);
end;
/
