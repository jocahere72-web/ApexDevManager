prompt --application/shared_components/navigation/lists/estadísticas_predios_urbanos
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(172590997655218439)
,p_name=>unistr('Estad\00EDsticas Predios Urbanos')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172591189662218455)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Destino Econ\00F3mico IGAC')
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_INDICADOR:DE:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172591562238218461)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Destino Habitacional'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:P5_INDICADOR:DH:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
