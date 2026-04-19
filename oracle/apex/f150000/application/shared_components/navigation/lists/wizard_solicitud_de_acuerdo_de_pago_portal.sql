prompt --application/shared_components/navigation/lists/wizard_solicitud_de_acuerdo_de_pago_portal
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(72235324874226079)
,p_name=>'Wizard Solicitud de Acuerdo de Pago- Portal'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72235680388226094)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Informaci\00F3n B\00E1sica')
,p_list_item_link_target=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72236000573226105)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Cartera'
,p_list_item_link_target=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72236454353226105)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Plan de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:106:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72236815298226105)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Garant\00EDa')
,p_list_item_link_target=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(72237223897226106)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Resumen'
,p_list_item_link_target=>'f?p=&APP_ID.:109:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
