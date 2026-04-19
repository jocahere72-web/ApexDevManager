prompt --application/shared_components/navigation/lists/predios_conservados_nuevos_y_retirados
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(175103772901135627)
,p_name=>'Predios Conservados, Nuevos y Retirados'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(175103976472135640)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Predios Nuevos, Conservados y Retirados'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:4:P4_INDICADOR:PCNR:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(175104339278135646)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Predios Conservados Activos'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:4:P4_INDICADOR:PCA:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(175104810605135647)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Predios Conservados Inactivos'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:4:P4_INDICADOR:PCI:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
