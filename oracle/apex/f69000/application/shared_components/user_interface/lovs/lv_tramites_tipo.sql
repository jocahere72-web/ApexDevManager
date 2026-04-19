prompt --application/shared_components/user_interface/lovs/lv_tramites_tipo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(89151809889991326)
,p_lov_name=>'LV_TRAMITES_TIPO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_trmte_tpo || '' - '' || dscrpcion as d,',
'       cdgo_trmte_tpo as r',
'  from df_s_tramites_tipo',
' order by cdgo_trmte_tpo'))
);
end;
/
