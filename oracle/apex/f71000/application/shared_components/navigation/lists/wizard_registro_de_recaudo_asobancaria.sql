prompt --application/shared_components/navigation/lists/wizard_registro_de_recaudo_asobancaria
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(15959830319946441)
,p_name=>'Wizard Registro de Recaudo Asobancaria'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15960081193946445)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Archivo'
,p_list_item_link_target=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15961132457961357)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Registro de Recaudos'
,p_list_item_link_target=>'f?p=&APP_ID.:263:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
