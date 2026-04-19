prompt --application/shared_components/user_interface/lovs/lv_report_queries
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(33415505717945630)
,p_lov_name=>'LV_REPORT_QUERIES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(name) as v',
'        , lower(name) as k',
'     from wwv_flow_shared_queries',
'    where flow_id = :APP_ID',
' group by lower(name)',
' order by 1'))
);
end;
/
