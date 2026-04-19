prompt --application/shared_components/plugins/region_type/información_básica_del_candidato
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(58050712380846766)
,p_plugin_type=>'REGION TYPE'
,p_name=>unistr('INFORMACI\00D3N B\00C1SICA DEL CANDIDATO')
,p_display_name=>unistr('Informaci\00F3n B\00E1sica del Candidato')
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','INFORMACIÓN BÁSICA DEL CANDIDATO'),'')
,p_api_version=>2
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
