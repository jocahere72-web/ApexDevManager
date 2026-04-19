prompt --application/shared_components/navigation/lists/desktop_navegatión_bar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(71980036653557378)
,p_name=>unistr('Desktop Navegati\00F3n Bar')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(71980255897557378)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'&F_NMBRE_CLNTE.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(71980684664557379)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'&F_NMBRE_INSPCCION.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(71981022485557379)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Bienvenido Sr(a) &F_NMBRE_USRIO.'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(71981484371557379)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Cambiar Clave'
,p_list_item_link_target=>'f?p=60000:915:&SESSION.::&DEBUG.:915:P915_USER_NAME:&APP_USER.'
,p_parent_list_item_id=>wwv_flow_api.id(71981022485557379)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(71981863092557379)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Cerrar Sesi\00F3n')
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(71981022485557379)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
