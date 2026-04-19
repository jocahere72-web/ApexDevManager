prompt --application/shared_components/navigation/lists/lv_acciones_flujo_trabajo
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(110782666718936961)
,p_name=>'LV_ACCIONES_FLUJO_TRABAJO'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(110782806791936965)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Nuevo Flujo'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:::'
,p_list_item_icon=>'fa-folder-plus'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(110783256138936969)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Nueva Tarea'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
