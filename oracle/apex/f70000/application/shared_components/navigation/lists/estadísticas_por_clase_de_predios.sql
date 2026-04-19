prompt --application/shared_components/navigation/lists/estadísticas_por_clase_de_predios
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(175145762242287000)
,p_name=>unistr('Estad\00EDsticas por Clase de Predios')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(175145970715287019)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Urbano y Rural'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:3:P3_INDICADOR:UR:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
