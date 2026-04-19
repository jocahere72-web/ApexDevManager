prompt --application/shared_components/navigation/lists/lv_wz_documentos_determinacion
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(35444422273960683)
,p_name=>'LV_WZ_DOCUMENTOS_DETERMINACION'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35444638856960697)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Tipo de Generaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35445087299960710)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Fechas de Vencimientos'
,p_list_item_link_target=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35445720877960710)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Tipo de Impresi\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:104:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
