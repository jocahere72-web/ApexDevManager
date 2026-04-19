prompt --application/shared_components/navigation/lists/lv_parametricas_plusvalia
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(93091620049932433)
,p_name=>'LV_PARAMETRICAS_PLUSVALIA'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(93091880161932450)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Configuraci\00F3n Archivo')
,p_list_item_link_target=>'f?p=&APP_ID.:166:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
