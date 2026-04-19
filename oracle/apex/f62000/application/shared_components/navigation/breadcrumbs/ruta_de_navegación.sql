prompt --application/shared_components/navigation/breadcrumbs/ruta_de_navegación
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(323684909360283918)
,p_name=>unistr('Ruta de navegaci\00F3n ')
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(9820947479855413)
,p_short_name=>'Estados Transicion'
,p_link=>'f?p=&APP_ID.:8:&SESSION.'
,p_page_id=>8
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(32488532115518436)
,p_short_name=>'Flujos'
,p_link=>'f?p=&APP_ID.:12:&SESSION.'
,p_page_id=>12
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(323685354852283925)
,p_parent_id=>0
,p_short_name=>'Inicio'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
end;
/
