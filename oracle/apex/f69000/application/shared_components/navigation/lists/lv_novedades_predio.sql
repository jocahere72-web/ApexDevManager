prompt --application/shared_components/navigation/lists/lv_novedades_predio
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(39216921043499959)
,p_name=>'LV_NOVEDADES_PREDIO'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39217183335499960)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Entidades de Novedad'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(48087245631653206)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Entidades por Acto'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
