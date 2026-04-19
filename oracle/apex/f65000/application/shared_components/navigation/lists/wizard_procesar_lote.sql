prompt --application/shared_components/navigation/lists/wizard_procesar_lote
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(44130073165393136)
,p_name=>'Wizard Procesar Lote'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(44131153887393139)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Paso 1'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(44134747976393143)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Paso 2'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
