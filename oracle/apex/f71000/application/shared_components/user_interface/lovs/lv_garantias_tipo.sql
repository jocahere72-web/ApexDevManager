prompt --application/shared_components/user_interface/lovs/lv_garantias_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(33754492628369580)
,p_lov_name=>'LV_GARANTIAS_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_grntia_tpo || '' - '' ||  dscrpcion as d,',
'       id_grntia_tpo as r',
'  from gf_d_garantias_tipo',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
