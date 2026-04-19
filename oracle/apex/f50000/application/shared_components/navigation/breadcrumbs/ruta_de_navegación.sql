prompt --application/shared_components/navigation/breadcrumbs/ruta_de_navegación
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(95249542318808741)
,p_name=>unistr('Ruta de navegaci\00F3n ')
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(84168975071199629)
,p_short_name=>'Reglas de Negocio'
,p_link=>'f?p=&APP_ID.:119:&SESSION.'
,p_page_id=>119
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(95249993956808752)
,p_parent_id=>0
,p_short_name=>'Taxation Smart'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
end;
/
