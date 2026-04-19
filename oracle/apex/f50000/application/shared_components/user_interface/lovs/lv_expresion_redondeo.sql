prompt --application/shared_components/user_interface/lovs/lv_expresion_redondeo
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(98855318163760126)
,p_lov_name=>'LV_EXPRESION_REDONDEO'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_rdndeo_exprsion as r',
'  from df_s_redondeos_expresion',
' order by 1'))
);
end;
/
