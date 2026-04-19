prompt --application/shared_components/navigation/lists/wizard_facturación_masiva_multiples_fechas
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(4414536068966851)
,p_name=>unistr('Wizard Facturaci\00F3n Masiva Multiples Fechas')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4428704657988892)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Vigencias'
,p_list_item_link_target=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4415677552966855)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Poblaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4419284214966863)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Fechas de Vencimientos'
,p_list_item_link_target=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(4423574650966868)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Resumen'
,p_list_item_link_target=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
