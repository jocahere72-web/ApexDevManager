prompt --application/shared_components/user_interface/lovs/lv_report_layouts
begin
wwv_flow_api.create_list_of_values(
 p_id=>wwv_flow_api.id(33414589919938370)
,p_lov_name=>'LV_REPORT_LAYOUTS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(report_layout_name) as v',
'        , lower(report_layout_name) as k',
'     from wwv_flow_report_layouts',
'    where flow_id = :APP_ID',
' group by lower(report_layout_name)',
' order by 1'))
);
end;
/
