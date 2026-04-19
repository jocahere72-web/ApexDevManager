prompt --application/shared_components/navigation/lists/widzard_de_solicitud_de_liquidación_de_rentas
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(76379350032438234)
,p_name=>unistr('Widzard de Solicitud de Liquidaci\00F3n de Rentas')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(76379548337438252)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Sujeto Tributo'
,p_list_item_link_target=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(76379947326438264)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Acto / Informaci\00F3n Relacionada')
,p_list_item_link_target=>'f?p=&APP_ID.:139:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(76380348452438264)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Proyecci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:141:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(76380719785438264)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Adjuntos'
,p_list_item_link_target=>'f?p=&APP_ID.:142:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(76381134764438265)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Resumen'
,p_list_item_link_target=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
