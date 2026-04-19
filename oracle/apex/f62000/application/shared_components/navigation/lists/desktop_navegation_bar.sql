prompt --application/shared_components/navigation/lists/desktop_navegation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(323710308219357494)
,p_name=>'Desktop Navegation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(323710472045357494)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Bienvenido Sr(a) &F_NMBRE_USRIO.'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(323711334131357501)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Cerrar Sesi\00F3n')
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(323710472045357494)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
