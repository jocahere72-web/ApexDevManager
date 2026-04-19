prompt --application/shared_components/navigation/lists/opciones_de_proceso_de_carga
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(103316407708318700)
,p_name=>'Opciones de proceso de carga'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(103316638502318718)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Regresar'
,p_list_item_link_target=>'f?p=&APP_ID.:&P8_BRANCH.:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-angle-left'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
