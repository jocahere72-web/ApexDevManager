prompt --application/shared_components/navigation/breadcrumbs/ruta_de_navegación
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(164115797574707888)
,p_name=>unistr('Ruta de navegaci\00F3n ')
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(164116189337707895)
,p_parent_id=>0
,p_short_name=>'Inicio'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
end;
/
