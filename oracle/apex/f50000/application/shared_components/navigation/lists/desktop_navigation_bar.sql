prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(102604296306718716)
,p_name=>'Desktop Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(135959245628846494)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'&F_NMBRE_CLNTE.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(136130632433078344)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'&F_NMBRE_INSPCCION.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(102604410252718729)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Bienvenido Sr(a) &F_NMBRE_USRIO.'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(102604850869718735)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Cambiar Clave'
,p_list_item_link_target=>'f?p=60000:915:&SESSION.::&DEBUG.:915:P915_USER_NAME:&APP_USER.'
,p_parent_list_item_id=>wwv_flow_api.id(102604410252718729)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(102605210894718739)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Cerrar Sesi\00F3n')
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(102604410252718729)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
