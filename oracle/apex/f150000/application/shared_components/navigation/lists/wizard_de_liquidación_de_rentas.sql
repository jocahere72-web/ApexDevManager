prompt --application/shared_components/navigation/lists/wizard_de_liquidación_de_rentas
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(4794665765814946)
,p_name=>unistr('Wizard de Liquidaci\00F3n de Rentas')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4794813756814961)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Consulta de Contribuyente'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4795279681814977)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Informaci\00F3n Relacionada')
,p_list_item_link_target=>'f?p=&APP_ID.:201:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4831595453231747)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Proyecci\00F3n de Liquidaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:202:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5048374570870754)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Adjuntos'
,p_list_item_link_target=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(5048862176873102)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Resumen'
,p_list_item_link_target=>'f?p=&APP_ID.:204:&SESSION.::&DEBUG.:17:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
