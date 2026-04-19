prompt --application/shared_components/user_interface/lovs/lv_novedades_persona_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(69905236563599567)
,p_lov_name=>'LV_NOVEDADES_PERSONA_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(dscrpcion) as d,',
'       cdgo_nvdad_prsna_estdo as r',
'  from si_d_novedades_prsna_estdo',
' order by 1'))
);
end;
/
