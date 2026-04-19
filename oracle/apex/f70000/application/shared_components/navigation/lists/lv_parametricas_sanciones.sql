prompt --application/shared_components/navigation/lists/lv_parametricas_sanciones
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(38023606260188687)
,p_name=>'LV_PARAMETRICAS_SANCIONES'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(38023861953188702)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Tipo de Sanciones'
,p_list_item_link_target=>'f?p=&APP_ID.:107:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(38434604314034876)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Sanciones'
,p_list_item_link_target=>'f?p=&APP_ID.:121:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
