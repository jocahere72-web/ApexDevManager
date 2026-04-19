prompt --application/shared_components/user_interface/lovs/lv_metodo_revocatoria
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(34054954627415283)
,p_lov_name=>'LV_METODO_REVOCATORIA'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       id_rvctria_mtdo as r',
'  from gf_d_revocatoria_metodo',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
