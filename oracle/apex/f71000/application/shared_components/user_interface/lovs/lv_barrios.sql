prompt --application/shared_components/user_interface/lovs/lv_barrios
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(180581194913806426)
,p_lov_name=>'LV_BARRIOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nmbre_brrio as d,',
'       id_brrio as r',
'  from df_c_barrios',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
