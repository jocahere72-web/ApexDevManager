prompt --application/shared_components/plugins/region_type/com_infortributos_workflow
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(49843921649012422)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.INFORTRIBUTOS.WORKFLOW'
,p_display_name=>' Workflow'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.INFORTRIBUTOS.WORKFLOW'),'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.workflow/')
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#1.0/workflowChart/svg.min.js',
'#PLUGIN_FILES#1.0/workflowChart/workflowChart.js',
'#PLUGIN_FILES#1.0/workflow.js?v=7000',
'#PLUGIN_FILES#1.0/tooltipster/dist/js/tooltipster.bundle.js',
'#PLUGIN_FILES#1.0/modal/jquery.modal.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#1.0/css/style.css',
'#PLUGIN_FILES#1.0/tooltipster/dist/css/tooltipster.bundle.min.css',
'#PLUGIN_FILES#1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-borderless.min.css',
'#PLUGIN_FILES#1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#PLUGIN_FILES#1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-punk.min.css',
'#PLUGIN_FILES#1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-noir.min.css',
'#PLUGIN_FILES#1.0/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-shadow.min.css',
'#PLUGIN_FILES#1.0/modal/jquery.modal.min.css'))
,p_api_version=>2
,p_render_function=>'pkg_pl_workflow_1_0.fnc_render'
,p_ajax_function=>'pkg_pl_workflow_1_0.fnc_ajax'
,p_substitute_attributes=>true
,p_reference_id=>172544009374350223
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_files_version=>5
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(31424437743580689)
,p_plugin_id=>wwv_flow_api.id(49843921649012422)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Cliente'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'&F_CDGO_CLNTE.'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(31424861060580691)
,p_plugin_id=>wwv_flow_api.id(49843921649012422)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>'Instancia'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'&F_ID_INSTNCIA_FLJO.'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(31425226277580691)
,p_plugin_id=>wwv_flow_api.id(49843921649012422)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Tarea'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_default_value=>'&F_ID_FLJO_TREA.'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(31425603996580691)
,p_plugin_id=>wwv_flow_api.id(49843921649012422)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Mostrar botones'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'true'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(31426076554580692)
,p_plugin_id=>wwv_flow_api.id(49843921649012422)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>'Modo de Regreso sin permiso'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(31426427541580692)
,p_plugin_attribute_id=>wwv_flow_api.id(31426076554580692)
,p_display_sequence=>10
,p_display_value=>unistr('P\00E1gina anterior')
,p_return_value=>'PAGINA_ANTERIOR'
);
wwv_flow_api.create_plugin_attr_value(
 p_id=>wwv_flow_api.id(31426961934580693)
,p_plugin_attribute_id=>wwv_flow_api.id(31426076554580692)
,p_display_sequence=>20
,p_display_value=>unistr('P\00E1gina espec\00EDfica')
,p_return_value=>'PAGINA_ESPECIFICA'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(31427410825580693)
,p_plugin_id=>wwv_flow_api.id(49843921649012422)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>unistr('Aplicaci\00F3n de Regreso sin permiso')
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(31426076554580692)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGINA_ESPECIFICA'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(31427831930580694)
,p_plugin_id=>wwv_flow_api.id(49843921649012422)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>unistr('P\00E1gina de regreso sin permiso')
,p_attribute_type=>'INTEGER'
,p_is_required=>false
,p_default_value=>'1'
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_api.id(31426076554580692)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'PAGINA_ESPECIFICA'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(31428268446580694)
,p_plugin_id=>wwv_flow_api.id(49843921649012422)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Usuario especifico'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_default_value=>'-1'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('Este usuario espec\00EDfico es utilizado cuando se necesita asignar una tarea a un usuario espec\00EDfico. <br>'),
unistr('Este usuario espec\00EDfico debe ser calculado previamente y seteado en el \00EDtem de p\00E1gina PXX_ID_USRIO_ESPCFCO')))
);
end;
/
