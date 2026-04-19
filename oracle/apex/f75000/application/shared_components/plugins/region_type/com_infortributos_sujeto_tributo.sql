prompt --application/shared_components/plugins/region_type/com_infortributos_sujeto_tributo
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(82928976202795093)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.INFORTRIBUTOS.SUJETO_TRIBUTO'
,p_display_name=>'Sujeto Tributo'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.INFORTRIBUTOS.SUJETO_TRIBUTO'),'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.sujeto_tributo/')
,p_javascript_file_urls=>'#PLUGIN_FILES#1.0/script.js'
,p_api_version=>2
,p_render_function=>'pkg_pl_sujeto_tributo_1_0.fnc_render'
,p_substitute_attributes=>true
,p_reference_id=>108632748177088825
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'2.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(82929289047795093)
,p_plugin_id=>wwv_flow_api.id(82928976202795093)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Sujeto Impuesto'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP'
,p_is_translatable=>false
);
end;
/
