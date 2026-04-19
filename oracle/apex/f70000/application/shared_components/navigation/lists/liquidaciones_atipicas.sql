prompt --application/shared_components/navigation/lists/liquidaciones_atipicas
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(173539914242298395)
,p_name=>'Liquidaciones Atipicas'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173542488314335388)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Predios Campo Alegre'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_INDICADOR:PCA:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173548319432550708)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Predios Banco Inmobiliario'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_INDICADOR:PBI:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173550717105636526)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Predios Estatales'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_INDICADOR:PE:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173553411811706581)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Predios Las Cayenas'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_INDICADOR:PC:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173554469010792067)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Plan Parcial Villa San Pablo'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:7:P7_INDICADOR:PVS:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
