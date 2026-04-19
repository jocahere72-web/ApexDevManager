prompt --application/shared_components/navigation/lists/desktop_navigation_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(92980788809010799)
,p_name=>'Desktop  Navigation Bar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(92980988617010815)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'&F_NMBRE_CLNTE.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(92981364405010839)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'&F_NMBRE_INSPCCION.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(92981728216010841)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Bienvenido Sr(a) &F_NMBRE_USRIO.'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(92982116123010841)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Cambiar Clave'
,p_list_item_link_target=>'f?p=60000:915:&SESSION.::&DEBUG.:915:P915_USER_NAME:&APP_USER.'
,p_parent_list_item_id=>wwv_flow_api.id(92981728216010841)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(92982583728010846)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Cerrar Sesi\00F3n')
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(92981728216010841)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
