prompt --application/shared_components/navigation/lists/menú_de_navegación_de_escritorio
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(237198032685524162)
,p_name=>unistr('Men\00FA de navegaci\00F3n de escritorio')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(237328353764524282)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Inicio'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
