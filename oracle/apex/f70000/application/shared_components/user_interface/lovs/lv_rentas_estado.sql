prompt --application/shared_components/user_interface/lovs/lv_rentas_estado
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(82207264495076862)
,p_lov_name=>'LV_RENTAS_ESTADO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_rnta_estdo as r',
'  from gi_d_rentas_estado',
' order by 1'))
);
end;
/
