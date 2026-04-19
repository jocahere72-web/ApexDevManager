prompt --application/shared_components/navigation/lists/desktop_navigation_menu
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(304865353486291416)
,p_name=>'Desktop Navigation Menu'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(304918924828291878)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Inicio'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(103906422350787798)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Control Errores'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cogs'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'5,8,9,10'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(104137492351148482)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>unistr('Configuraci\00F3n Mensajes Errores')
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar-ban'
,p_parent_list_item_id=>wwv_flow_api.id(103906422350787798)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'9'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(104179079761313672)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Log Error'
,p_list_item_link_target=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-align-justify'
,p_parent_list_item_id=>wwv_flow_api.id(103906422350787798)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'10'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(103908217975793178)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Log'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-format'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'6,7,4'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(103889275366656279)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Informe Logs'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-newspaper-o'
,p_parent_list_item_id=>wwv_flow_api.id(103908217975793178)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(104741328865566359)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>unistr('Configuraci\00F3n Logs')
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-cogs'
,p_parent_list_item_id=>wwv_flow_api.id(103908217975793178)
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
