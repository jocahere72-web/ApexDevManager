prompt --application/shared_components/user_interface/lovs/lv_decretos
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(40692910121347445)
,p_lov_name=>'LV_DECRETOS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DSCRPCION as d,',
'        ID_DCRTO as r',
'  from DF_C_DECRETOS',
'  where cdgo_clnte = :F_CDGO_CLNTE',
' order by 1'))
);
end;
/
