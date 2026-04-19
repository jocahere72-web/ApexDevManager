prompt --application/shared_components/navigation/lists/lv_parametricas_rentas
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(19331315948810319)
,p_name=>'LV_PARAMETRICAS_RENTAS'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19331551099810326)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Configuraciones Cliente'
,p_list_item_link_target=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19603013187038163)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Asociada por Sub Tributo'
,p_list_item_link_target=>'f?p=&APP_ID.:87:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(100243730250826806)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Causales de Devoluci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:186:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
