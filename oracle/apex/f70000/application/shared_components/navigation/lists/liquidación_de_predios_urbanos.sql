prompt --application/shared_components/navigation/lists/liquidación_de_predios_urbanos
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(173591633207130508)
,p_name=>unistr('Liquidaci\00F3n de Predios Urbanos')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173593940770160643)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Destino lote Urbanizable no urbanizado, Urbanizado no construido y/o Edificado, No Urbanizable'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_INDICADOR:PRST:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173601437349269161)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Destino lote urbanizable no urbanizado y urbanizado no construido y/o edificado '
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_INDICADOR:DLU:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173599531514239730)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Destinos Homologados '
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_INDICADOR:DH:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173623810661483139)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Destino Uso P\00FAblico')
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_INDICADOR:DUP:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173627417004525370)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Destinos No Homologados'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_INDICADOR:DNH:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173761338603400583)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Predios Nuevos y Existentes por Estrato 1'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_INDICADOR:PNEE:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(173781593081664849)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>unistr('Destinos no Homologados Sin Caso de Liquidaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:9:P9_INDICADOR:DHL:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
