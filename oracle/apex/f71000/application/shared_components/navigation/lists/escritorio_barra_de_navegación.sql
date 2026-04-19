prompt --application/shared_components/navigation/lists/escritorio_barra_de_navegación
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(177366442570050651)
,p_name=>unistr('Escritorio Barra de Navegaci\00F3n')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(178171506760525859)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'&F_NMBRE_CLNTE.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(178172035014528590)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Bienvenido Sr(a) &F_NMBRE_USRIO.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(178172304503530385)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Cambiar Clave'
,p_list_item_link_target=>'f?p=60000:915:&SESSION.::&DEBUG.:915:P915_USER_NAME:&APP_USER.'
,p_parent_list_item_id=>wwv_flow_api.id(178172035014528590)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(178172577584534793)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Cerrar Sesi\00F3n')
,p_list_item_link_target=>'&LOGOUT_URL.'
,p_list_item_icon=>'fa-sign-out'
,p_parent_list_item_id=>wwv_flow_api.id(178172035014528590)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
