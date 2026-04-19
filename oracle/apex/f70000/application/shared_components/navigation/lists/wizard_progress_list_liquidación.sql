prompt --application/shared_components/navigation/lists/wizard_progress_list_liquidación
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(164161515661364020)
,p_name=>unistr('Wizard Progress List Liquidaci\00F3n')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(164166152965364088)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Vigencias'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(164170506416364091)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Archivo'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(164183401852364102)
,p_list_item_display_sequence=>32
,p_list_item_link_text=>'Criticas Cinta'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(170224506175728378)
,p_list_item_display_sequence=>35
,p_list_item_link_text=>unistr('Homologaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(164179074267364100)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Pre Liquidar'
,p_list_item_link_target=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(172958523635267965)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>unistr('Criticas Pre Liquidaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(178062612529788608)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Paso a Cartera'
,p_list_item_link_target=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
