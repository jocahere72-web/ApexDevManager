prompt --application/shared_components/user_interface/lovs/lv_mutaciones_clase
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(89494709908470580)
,p_lov_name=>'LV_MUTACIONES_CLASE'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_mtcion_clse || '' - '' || dscrpcion as d,',
'       cdgo_mtcion_clse as r',
'  from df_s_MUTACIONES_CLASE',
' order by dscrpcion'))
);
end;
/
