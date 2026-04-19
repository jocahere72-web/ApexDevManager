prompt --application/shared_components/user_interface/lovs/lv_tipo_acto
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(36091714677885602)
,p_lov_name=>'LV_TIPO_ACTO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select cdgo_acto_tpo||'' - ''||dscrpcion d, cdgo_acto_tpo r  ',
'From gn_d_actos_tipo',
'where cdgo_clnte = :F_CDGO_CLNTE and',
'      indcdor_ntfccion = ''S'';'))
);
end;
/
