prompt --application/shared_components/navigation/lists/lv_documentos
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(180384257122068032)
,p_name=>'LV_DOCUMENTOS'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(183881544247393141)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Descuentos'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(180384522650068032)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tipos de Documentos'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15261236845943079)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Datos Jobs Documentos Masivo'
,p_list_item_link_target=>'f?p=&APP_ID.:288:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
