prompt --application/shared_components/navigation/lists/lv_parametricas_declaraciones
begin
wwv_flow_api.create_list(
 p_id=>wwv_flow_api.id(18555863886403602)
,p_name=>'LV Parametricas Declaraciones'
,p_list_status=>'PUBLIC'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(39507774122393411)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Tipo Atributos'
,p_list_item_link_target=>'f?p=&APP_ID.:82:&SESSION.::&DEBUG.:82:::'
,p_list_item_icon_alt_attribute=>'Tipo Atributos'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(22567332505889857)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>unistr('Estados de Declaraci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:95:&SESSION.::&DEBUG.:95:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(33731479356156344)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>unistr('Uso de Declaraci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:102:&SESSION.::&DEBUG.:102:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18556036340403609)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>unistr('Tipos de Declaraci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:67:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(76598760207040594)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>unistr('Tipos de Limites de Presentaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:140:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18677493436405755)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>unistr('Fechas de Presentaci\00F3n de Declaraci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:77:&SESSION.::&DEBUG.:77:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18782526176272912)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Propiedades de Formulario'
,p_list_item_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:26:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18879281769621042)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Formularios por Periodo'
,p_list_item_link_target=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:79:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(18994493058459111)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>unistr('Definici\00F3n de Objetos')
,p_list_item_link_target=>'f?p=&APP_ID.:83:&SESSION.::&DEBUG.:83:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(19116545400661940)
,p_list_item_display_sequence=>160
,p_list_item_link_text=>unistr('Homologaci\00F3n de Objetos')
,p_list_item_link_target=>'f?p=&APP_ID.:85:&SESSION.::&DEBUG.:85:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(67528179976447130)
,p_list_item_display_sequence=>170
,p_list_item_link_text=>unistr('Selecci\00F3n de Atributos por Formularios')
,p_list_item_link_target=>'f?p=&APP_ID.:129:&SESSION.::&DEBUG.:129:::'
,p_list_item_icon_alt_attribute=>unistr('Selecci\00F3n de Atributos por Formularios')
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(48505459485175740)
,p_list_item_display_sequence=>200
,p_list_item_link_text=>unistr('Elementos de Declaraci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(62458608548222428)
,p_list_item_display_sequence=>220
,p_list_item_link_text=>'Tipo de Esquema - Declaraciones'
,p_list_item_link_target=>'f?p=&APP_ID.:128:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(62455852490160112)
,p_list_item_display_sequence=>230
,p_list_item_link_text=>'Esquema Tarifario - Declaraciones'
,p_list_item_link_target=>'f?p=&APP_ID.:127:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(130284543347344986)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>unistr('Tipo Origen Declaraci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:278:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon_attributes=>unistr('Tipo Origen Declaraci\00F3n')
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(130285649850358542)
,p_list_item_display_sequence=>250
,p_list_item_link_text=>'Carga de Declaraciones'
,p_list_item_link_target=>'f?p=&APP_ID.:287:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon_attributes=>'Carga de Declaraciones'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(16716347982949999)
,p_list_item_display_sequence=>260
,p_list_item_link_text=>'Tipos de Archivos Adjuntos'
,p_list_item_link_target=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon_attributes=>'Tipos de Archivos Adjuntos'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(66505132944061694)
,p_list_item_display_sequence=>270
,p_list_item_link_text=>unistr('Homologaci\00F3n Declaraciones V2')
,p_list_item_link_target=>'f?p=&APP_ID.:246:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(95019325125973608)
,p_list_item_display_sequence=>280
,p_list_item_link_text=>unistr('Gesti\00F3n Vencimiento de Autorizaci\00F3n ')
,p_list_item_link_target=>'f?p=&APP_ID.:2024016:&SESSION.::&DEBUG.:202416:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_api.create_list_item(
 p_id=>wwv_flow_api.id(95021494071988675)
,p_list_item_display_sequence=>290
,p_list_item_link_text=>unistr('Impuestos Solicitudes Autorizaci\00F3n')
,p_list_item_link_target=>'f?p=&APP_ID.:2024017:&SESSION.::&DEBUG.:2024017:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
end;
/
