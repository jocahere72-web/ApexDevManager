prompt --application/shared_components/navigation/lists/wizard_registro_de_recaudo_manual
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(45075175915594155)
,p_name=>'Wizard Registro de Recaudo Manual'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(45076245762594156)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Recaudo Control'
,p_list_item_link_target=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(45079893085594157)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Recaudos'
,p_list_item_link_target=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
