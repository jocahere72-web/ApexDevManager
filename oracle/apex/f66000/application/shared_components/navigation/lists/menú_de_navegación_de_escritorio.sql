prompt --application/shared_components/navigation/lists/menú_de_navegación_de_escritorio
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(35696339354290389)
,p_name=>unistr('Men\00FA de navegaci\00F3n de escritorio')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35826734475290492)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Inicio'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35884495689290637)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Administraci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:10000:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-user-wrench'
,p_security_scheme=>wwv_flow_api.id(35819250269290478)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
