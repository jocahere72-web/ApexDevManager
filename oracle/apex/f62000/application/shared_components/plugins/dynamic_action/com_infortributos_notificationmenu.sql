prompt --application/shared_components/plugins/dynamic_action/com_infortributos_notificationmenu
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(72412932334170993)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'COM.INFORTRIBUTOS.NOTIFICATIONMENU'
,p_display_name=>'NotificationMenu'
,p_category=>'NOTIFICATION'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','COM.INFORTRIBUTOS.NOTIFICATIONMENU'),'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.notificationmenu/')
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#1.0/js/script.js',
'https://cdn.jsdelivr.net/npm/sweetalert2@7.33.1/dist/sweetalert2.all.min.js'))
,p_css_file_urls=>'#PLUGIN_FILES#1.0/css/style.css'
,p_api_version=>2
,p_render_function=>'pkg_pl_notificationmenu_1_0.f_render'
,p_ajax_function=>'pkg_pl_notificationmenu_1_0.f_ajax'
,p_substitute_attributes=>true
,p_reference_id=>118384881734208393
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25516503927590333)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>unistr('Identificador Est\00E1tico')
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'notification-menu'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25516966933590349)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Origen SQL'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_default_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id_alrta                                  as NOTE_ID,',
'       icno                                      as NOTE_ICON,',
'       icno_clor                                 as NOTE_ICON_COLOR,',
'       clor_alrta                                as NOTE_COLOR,',
'       ttlo                                      as NOTE_HEADER,',
'       dscrpcion                                 as NOTE_TEXT,',
'       replace(url, ''APP_SESSION'',:APP_SESSION)  as NOTE_LINK',
'from v_ma_g_alertas',
'where cdgo_estdo = ''ENV'' and',
'      id_usrio = :F_ID_USRIO'))
,p_sql_min_column_count=>1
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ''fa-check'' NOTE_ICON,',
'       ''#26a043'' NOTE_ICON_COLOR,',
'       ''#26a043'' NOTE_COLOR,',
'       ''Exitoso'' NOTE_HEADER,',
'       ''Test Exitoso'' NOTE_TEXT,',
'       null NOTE_LINK',
'from dual'))
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25517314225590354)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Elementos a Ejecutar'
,p_attribute_type=>'PAGE ITEMS'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25517741457590354)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Icono'
,p_attribute_type=>'ICON'
,p_is_required=>true
,p_default_value=>'fa-bell'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25518196739590355)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Color Icono'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'white'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25518529679590355)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Color de Fondo'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'#0073FF'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25518952065590355)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Color Contador'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'rgb(232, 55, 55 )'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25519363773590355)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>'Color Fuente Contador'
,p_attribute_type=>'COLOR'
,p_is_required=>true
,p_default_value=>'white'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25519791564590356)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>unistr('Abrir URL en otra P\00E1gina ')
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25520143307590356)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Mostrar Siempre'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25520545774590356)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>120
,p_prompt=>'Escapar Caracteres Especiales'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25520982707590356)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>130
,p_prompt=>'Actualiza Estado de Alerta'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25521373443590356)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Procedimiento Actualiza'
,p_attribute_type=>'PLSQL'
,p_is_required=>true
,p_default_value=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    pkg_ma_alertas.prc_ac_alerta_estado(:NOTE_ID);',
'end;'))
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(25520982707590356)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'Y'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(25521755277590358)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>unistr('Actualiza Notificaci\00F3n por WebSocket')
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_event(
 p_id=>wwv_flow_api.id(25523158163590374)
,p_plugin_id=>wwv_flow_api.id(72412932334170993)
,p_name=>'refresh-notification-menu'
,p_display_name=>'Refresh Notification Menu'
);
end;
/
