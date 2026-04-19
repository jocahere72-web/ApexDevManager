prompt --application/shared_components/navigation/lists/lv_menu_convenios_pago
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(33202988864063642)
,p_name=>'LV_MENU_CONVENIOS_PAGO'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18383350435413813)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>unistr('Configuraci\00F3n Acuerdos de Pago')
,p_list_item_link_target=>'f?p=&APP_ID.:357:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33203117621063646)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>unistr('Tipos de Garant\00EDa')
,p_list_item_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33285365612446731)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tipo de Secuencias'
,p_list_item_link_target=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33328000855607133)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>unistr('M\00E9todos de Revocatoria')
,p_list_item_link_target=>'f?p=&APP_ID.:28:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33679483076196201)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Tipos de Acuerdos de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(99716393952181236)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>unistr('Motivos de Anulaci\00F3n de Acuerdos de Pago')
,p_list_item_link_target=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(103787326008814906)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>unistr('Tipos de Modificaci\00F3n de Acuerdos de Pago')
,p_list_item_link_target=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(103803576490999393)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>unistr('Estados de Modificaci\00F3n de Acuerdos de Pago')
,p_list_item_link_target=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(104554124287995476)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Estados de Revocatoria de Acuerdos de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(120499727043241705)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Estados de Acuerdos de Pago'
,p_list_item_link_target=>'f?p=&APP_ID.:222:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(120500004353244696)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>unistr('Estados de Reversi\00F3n de Acuerdos de Pago')
,p_list_item_link_target=>'f?p=&APP_ID.:223:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
