prompt --application/shared_components/navigation/lists/lv_recaudo
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(14027197828235432)
,p_name=>'LV_RECAUDO'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14027383367235433)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Origen de Recaudos'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14027717603235433)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Estados de Recaudo'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14028187628235433)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Tipo Origen de Recaudo'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14028542540235433)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Medios de Recaudo - Asobancaria'
,p_list_item_link_target=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(14028938523235434)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Tipo de Recaudo - Asobancaria'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
