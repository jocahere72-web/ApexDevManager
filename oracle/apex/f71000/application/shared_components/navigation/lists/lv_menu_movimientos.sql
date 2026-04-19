prompt --application/shared_components/navigation/lists/lv_menu_movimientos
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(180366332803041509)
,p_name=>'LV_MENU_MOVIMIENTOS'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(180366442647041525)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Origen de Movimiento'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(180366847662041533)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tipo de Movimientos'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(180367252220041534)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Estados de Movimientos'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
