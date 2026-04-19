prompt --application/shared_components/navigation/lists/informes_de_actividades
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(35885599319290639)
,p_name=>'Informes de Actividades'
,p_list_status=>'PUBLIC'
,p_required_patch=>wwv_flow_api.id(35818030447290460)
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35885936913290639)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Panel de Control'
,p_list_item_link_target=>'f?p=&APP_ID.:10010:&SESSION.::&DEBUG.:10010:::'
,p_list_item_icon=>'fa-area-chart'
,p_list_text_01=>unistr('Ver m\00E9tricas de actividad de la aplicaci\00F3n')
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35886385894290639)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Usuarios Principales'
,p_list_item_link_target=>'f?p=&APP_ID.:10011:&SESSION.::&DEBUG.:10011:::'
,p_list_item_icon=>'fa-user-chart'
,p_list_text_01=>unistr('Informe de vistas de p\00E1gina agregadas por usuarios')
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35886732688290639)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Log de errores de la aplicaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:10012:&SESSION.::&DEBUG.:10012:::'
,p_list_item_icon=>'fa-exclamation'
,p_list_text_01=>unistr('Informe de errores registrados por esta aplicaci\00F3n')
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35887157530290639)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Rendimiento de P\00E1gina')
,p_list_item_link_target=>'f?p=&APP_ID.:10013:&SESSION.::&DEBUG.:10013:::'
,p_list_item_icon=>'fa-file-chart'
,p_list_text_01=>unistr('Informe de actividad y rendimiento por p\00E1gina de aplicaci\00F3n')
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(35887542917290640)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('Vistas de P\00E1gina')
,p_list_item_link_target=>'f?p=&APP_ID.:10014:&SESSION.::&DEBUG.:RIR,10014:::'
,p_list_item_icon=>'fa-file-search'
,p_list_text_01=>unistr('Informe de cada vista de p\00E1gina por usuario, incluida la fecha de acceso y el tiempo transcurrido')
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
