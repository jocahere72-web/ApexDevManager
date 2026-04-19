prompt --application/shared_components/navigation/lists/estadísticas_predios_rurales
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(173525188166103079)
,p_name=>unistr('Estad\00EDsticas Predios Rurales')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173525334971103085)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Predios Rurales'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:6:P6_INDICADOR:PR:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
