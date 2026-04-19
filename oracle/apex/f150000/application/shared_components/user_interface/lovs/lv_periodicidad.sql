prompt --application/shared_components/user_interface/lovs/lv_periodicidad
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(72561432564314276)
,p_lov_name=>'LV_PERIODICIDAD'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select dscrpcion as d,',
'       cdgo_prdcdad as r',
'  from df_s_periodicidad',
' order by cntdad_vce_anio desc'))
);
end;
/
