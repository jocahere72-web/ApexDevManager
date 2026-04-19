prompt --application/shared_components/user_interface/lovs/lv_cargos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(96950450822767086)
,p_lov_name=>'LV_CARGOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_crgo as d,',
'       id_crgo as r',
'  from df_c_cargos',
' where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
