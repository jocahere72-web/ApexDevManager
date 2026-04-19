prompt --application/shared_components/user_interface/lovs/lv_tipo_acto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(40691008659279654)
,p_lov_name=>'LV_TIPO_ACTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select dscrpcion as d,',
'       id_acto_tpo as r',
'  from gn_d_actos_tipo',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
