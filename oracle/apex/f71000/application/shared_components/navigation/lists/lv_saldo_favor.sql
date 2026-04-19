prompt --application/shared_components/navigation/lists/lv_saldo_favor
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(91967478641264222)
,p_name=>'LV_SALDO_FAVOR'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91967654063264223)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Tipo de Saldos a Favor'
,p_list_item_link_target=>'f?p=&APP_ID.:80:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91981365737380749)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tipo de Movimientos'
,p_list_item_link_target=>'f?p=&APP_ID.:133:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(110569318935564152)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Motivos de Ajuster por Saldo a Favor'
,p_list_item_link_target=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(120525276991643437)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Estados de la solicitud de Saldo a Favor'
,p_list_item_link_target=>'f?p=&APP_ID.:224:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
