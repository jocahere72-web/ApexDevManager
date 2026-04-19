prompt --application/shared_components/navigation/breadcrumbs/breadcrumb
begin
wwv_flow_api.create_menu(
 p_id=>wwv_flow_api.id(17310371681919339)
,p_name=>'Breadcrumb'
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(17310573072919339)
,p_short_name=>'Inicio'
,p_link=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.'
,p_page_id=>1
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(48596182653439236)
,p_parent_id=>wwv_flow_api.id(17310573072919339)
,p_short_name=>'Botones'
,p_link=>'f?p=&APP_ID.:200:&SESSION.'
,p_page_id=>200
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(139650152704732142)
,p_short_name=>'133. Generaci&#xF3;n&#x2F;Impresi&#xF3;n de Actos Persuasiivos'
,p_link=>'f?p=&APP_ID.:133:&SESSION.'
,p_page_id=>133
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(139688386339737382)
,p_short_name=>'134. Consulta General de Procesos Persuasivos'
,p_link=>'f?p=&APP_ID.:134:&SESSION.'
,p_page_id=>134
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(139695005279742454)
,p_short_name=>'135. Configuraci&#xF3;n M&#xF3;dulo Persuasivo'
,p_link=>'f?p=&APP_ID.:135:&SESSION.'
,p_page_id=>135
);
wwv_flow_api.create_menu_option(
 p_id=>wwv_flow_api.id(154125719262899180)
,p_parent_id=>wwv_flow_api.id(17310573072919339)
,p_short_name=>'Tipos de Entidad'
,p_link=>'f?p=&APP_ID.:144:&SESSION.'
,p_page_id=>144
);
end;
/
