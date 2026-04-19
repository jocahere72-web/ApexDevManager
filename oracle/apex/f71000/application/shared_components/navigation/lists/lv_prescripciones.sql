prompt --application/shared_components/navigation/lists/lv_prescripciones
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(84978746077444945)
,p_name=>'LV_PRESCRIPCIONES'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(85667708444890348)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Tipos de Respuestas'
,p_list_item_link_target=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(118464753314179791)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Tipos de Prescripci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:218:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91684293290958341)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Motivos de Ajuste Por Prescripci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(29153793171587382)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Prescripciones P\00E1rrafo')
,p_list_item_link_target=>'f?p=&APP_ID.:275:&SESSION.::&DEBUG.::::'
,p_list_item_icon_alt_attribute=>unistr('Prescripciones P\00E1rrafo')
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(29154152379589290)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('Configuraci\00F3n Prescripci\00F3n ')
,p_list_item_link_target=>'f?p=&APP_ID.:286:&SESSION.::&DEBUG.::::'
,p_list_item_icon_alt_attribute=>unistr('Configuraci\00F3n Prescripci\00F3n ')
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
