prompt --application/shared_components/navigation/lists/wizard_solicitud_de_convenio_r
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(73655524996021574)
,p_name=>'Wizard Solicitud de Convenio R'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(73665786124032166)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>unistr('Informaci\00F3n B\00E1sica')
,p_list_item_link_target=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18373908259337580)
,p_list_item_display_sequence=>65
,p_list_item_link_text=>'Validaciones'
,p_list_item_link_target=>'f?p=&APP_ID.:360:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(73656125183021587)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Datos Acuerdo de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(74472578679896643)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Plan de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(73670480435040121)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>unistr('Garant\00EDa')
,p_list_item_link_target=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(73671588291043739)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>unistr('Generaci\00F3n Solicitud')
,p_list_item_link_target=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
