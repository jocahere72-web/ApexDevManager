prompt --application/shared_components/navigation/lists/lv_menu_ajustes
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(180374054057056898)
,p_name=>'LV_MENU_AJUSTES'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(180374311588056898)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Motivos de Ajustes'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(91739644920268302)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Procesos Tarea'
,p_list_item_link_target=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(98786222524480265)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Tipos de Adjuntos'
,p_list_item_link_target=>'f?p=&APP_ID.:144:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18328164329545285)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>unistr('M\00E9todo de aplicaci\00F3n de ajuste generados por otros procesos')
,p_list_item_link_target=>'f?p=&APP_ID.:276:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
