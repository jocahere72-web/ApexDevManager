prompt --application/shared_components/user_interface/lovs/lv_cnvnio_rvrsion_estdo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(35026559504158261)
,p_lov_name=>'LV_CNVNIO_RVRSION_ESTDO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(dscrpcion) as d,',
'       cdgo_cnvnio_rvrsion_estdo as r',
'  from gf_d_convenios_rvrsion_estdo',
' order by 1'))
);
end;
/
