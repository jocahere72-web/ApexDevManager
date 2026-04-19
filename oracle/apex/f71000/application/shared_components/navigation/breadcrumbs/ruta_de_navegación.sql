prompt --application/shared_components/navigation/breadcrumbs/ruta_de_navegación
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(177376125158050703)
,p_name=>unistr('Ruta de navegaci\00F3n ')
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(39184172083944456)
,p_short_name=>'Panel Control Ajustes'
,p_link=>'f?p=&APP_ID.:33:&SESSION.'
,p_page_id=>33
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(108975599786535455)
,p_short_name=>'Motivo Rechazo acuerdo pago'
,p_link=>'f?p=&APP_ID.:190:&SESSION.'
,p_page_id=>190
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(177376528842050707)
,p_parent_id=>0
,p_short_name=>'Inicio'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
end;
/
