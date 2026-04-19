prompt --application/shared_components/navigation/lists/escritorio_barra_de_navegación
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(164114387812707811)
,p_name=>unistr('Escritorio Barra de Navegaci\00F3n')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(164114560507707845)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Desconectar'
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_current_for_pages=>'&LOGOUT_URL.'
);
end;
/
