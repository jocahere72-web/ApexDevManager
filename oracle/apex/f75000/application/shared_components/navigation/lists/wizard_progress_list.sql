prompt --application/shared_components/navigation/lists/wizard_progress_list
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(95865214435469328)
,p_name=>'Wizard Progress List'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(95866268749469344)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Consulta de Veh\00EDculo.')
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'40'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(96024056198808130)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Gerneraci\00F3n de Informaci\00F3n.')
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'13'
);
end;
/
