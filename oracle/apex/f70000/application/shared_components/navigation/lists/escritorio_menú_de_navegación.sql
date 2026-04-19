prompt --application/shared_components/navigation/lists/escritorio_menú_de_navegación
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(164062251339707581)
,p_name=>unistr('Escritorio Men\00FA de Navegaci\00F3n')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(164115832702707894)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Inicio'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
end;
/
