prompt --application/shared_components/navigation/lists/avaluós_totales_recibidos
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(175041528800859838)
,p_name=>unistr('Avalu\00F3s Totales Recibidos')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(175041704537859844)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Total Predios Con Aval\00FAos Mayores a Cero')
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15:P15_INDICADOR:PAM:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(175042052298859846)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Total Predios Con Aval\00FAos Iguales a Cero')
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15:P15_INDICADOR:PAI:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(175042502520859847)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('Total Aval\00FAos')
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:15:P15_INDICADOR:TOT:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
