prompt --application/shared_components/navigation/lists/registros_y_predios_recibidos
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(174951318487216277)
,p_name=>'Registros y Predios Recibidos'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(174951460886216295)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Registros Enviados'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:10:P10_INDICADOR:RE:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(174951896038216308)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Predios Enviados'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:10:P10_INDICADOR:PE:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
