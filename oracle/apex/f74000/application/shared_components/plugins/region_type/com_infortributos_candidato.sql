prompt --application/shared_components/plugins/region_type/com_infortributos_candidato
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(58124478521706514)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.INFORTRIBUTOS.CANDIDATO'
,p_display_name=>'Fisca'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.INFORTRIBUTOS.CANDIDATO'),'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.fisca/')
,p_javascript_file_urls=>'#PLUGIN_FILES#1.0/script.js'
,p_api_version=>2
,p_render_function=>'pkg_pl_fisca_1_0.fnc_render'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58125137256715928)
,p_plugin_id=>wwv_flow_api.id(58124478521706514)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Instancia Flujo'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58198164607183229)
,p_plugin_id=>wwv_flow_api.id(58124478521706514)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Flujo Tarea'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(58379040303328306)
,p_plugin_id=>wwv_flow_api.id(58124478521706514)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Sujeto Impuesto'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(60147579773811172)
,p_plugin_id=>wwv_flow_api.id(58124478521706514)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Funcionario'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(69388550473956564)
,p_plugin_id=>wwv_flow_api.id(58124478521706514)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Expediente'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
end;
/
