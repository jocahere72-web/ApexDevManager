prompt --application/shared_components/navigation/lists/lv_titulos_judiciales
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(7196767273691067)
,p_name=>'LV_TITULOS_JUDICIALES'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7197152439695282)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Estados de T\00EDtulos')
,p_list_item_link_target=>'f?p=&APP_ID.:235:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7202627047750861)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Estados de T\00EDtulos Cargados')
,p_list_item_link_target=>'f?p=&APP_ID.:237:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7203057395753375)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Tipos de Solicitud de T\00EDtulos')
,p_list_item_link_target=>'f?p=&APP_ID.:238:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(7258271140941305)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Configuraci\00F3n T\00EDtulos')
,p_list_item_link_target=>'f?p=&APP_ID.:236:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(9369761528940036)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('\00C1reas Generadoras de T\00EDtulos')
,p_list_item_link_target=>'f?p=&APP_ID.:248:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(15908719253577121)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>unistr('Tipo de Proyecci\00F3n Aplicaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
