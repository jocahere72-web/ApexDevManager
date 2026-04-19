prompt --application/shared_components/navigation/lists/widzard_reversión_acuerdo_de_pago
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(100548660338945729)
,p_name=>unistr('Widzard Reversi\00F3n Acuerdo de Pago')
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(100548889339945739)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Informaci\00F3n B\00E1sica PQR')
,p_list_item_link_target=>'f?p=&APP_ID.:151:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(100549264595945745)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Datos Acuerdo de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:156:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
