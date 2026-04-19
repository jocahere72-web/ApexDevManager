prompt --application/shared_components/navigation/lists/wizard_liquidación_rentas
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(19871973436481830)
,p_name=>unistr('Wizard Liquidaci\00F3n Rentas')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19872122991481837)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Informaci\00F3n Base Liquidaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:93:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19872515187481838)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Sujeto Tributo'
,p_list_item_link_target=>'f?p=&APP_ID.:91:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19872914417481839)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Proyecci\00F3n Liquidaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:98:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19873307490481839)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Liquidaci\00F3n de Rentas')
,p_list_item_link_target=>'f?p=&APP_ID.:99:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
