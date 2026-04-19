prompt --application/shared_components/user_interface/lovs/lv_acto_tipos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(41767230569135626)
,p_lov_name=>'LV_ACTO_TIPOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_acto_tpo||'' - ''||dscrpcion d , id_acto_tpo r ',
'from gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      indcdor_ntfccion = ''S''',
'order by 1;'))
);
end;
/
