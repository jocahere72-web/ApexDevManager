prompt --application/shared_components/navigation/lists/lv_menu_gestion_novedades
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(39159215129314917)
,p_name=>'LV_MENU_GESTION_NOVEDADES'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39159469434314925)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Tipo de Tramites'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39161543681327340)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Clase de Mutaciones'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39161962046331943)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Tramite Mutaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(68278285178477435)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Tipos de Resoluci\00F3n por Carga ETL')
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(11888181169025781)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Homologacion tipos tramites CatastroPro'
,p_list_item_link_target=>'f?p=&APP_ID.:2026004:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
