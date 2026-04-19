prompt --application/shared_components/user_interface/lovs/lv_garantias_tipo2
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(42779204409396113)
,p_lov_name=>'LV_GARANTIAS_TIPO2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_grntia_tpo as d,',
'       dscrpcion as r',
'  from gf_d_garantias_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
