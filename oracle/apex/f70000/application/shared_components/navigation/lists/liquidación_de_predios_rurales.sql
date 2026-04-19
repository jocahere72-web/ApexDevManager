prompt --application/shared_components/navigation/lists/liquidación_de_predios_rurales
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(173556664097939863)
,p_name=>unistr('Liquidaci\00F3n de Predios Rurales')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173559693936982283)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Estad\00EDsticas Previas Pre Liquidaci\00F3n ')
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8:P8_INDICADOR:PR:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
