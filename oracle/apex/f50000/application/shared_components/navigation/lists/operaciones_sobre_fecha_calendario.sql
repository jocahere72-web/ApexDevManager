prompt --application/shared_components/navigation/lists/operaciones_sobre_fecha_calendario
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(139654921743019001)
,p_name=>'Operaciones sobre fecha calendario'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(139655191600019015)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Asignar como festivo'
,p_list_item_link_target=>'f?p=&APP_ID.::&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
