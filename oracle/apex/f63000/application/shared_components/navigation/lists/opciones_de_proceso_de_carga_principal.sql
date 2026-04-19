prompt --application/shared_components/navigation/lists/opciones_de_proceso_de_carga_principal
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(103390272344824034)
,p_name=>'Opciones de proceso de carga principal'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(103390412447824042)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Nuevo proceso'
,p_list_item_link_target=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:8:P8_BRANCH:&APP_PAGE_ID.:'
,p_list_item_icon=>'fa-folder-plus'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
