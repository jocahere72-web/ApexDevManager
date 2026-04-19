prompt --application/shared_components/navigation/lists/regresar
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(100428640707002884)
,p_name=>'Regresar'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(100428865920002895)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Regresar'
,p_list_item_link_target=>'f?p=&APP_ID.:&F_BRANCH.:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-angle-left'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
