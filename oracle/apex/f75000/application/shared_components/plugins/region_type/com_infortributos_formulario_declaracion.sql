prompt --application/shared_components/plugins/region_type/com_infortributos_formulario_declaracion
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(94586007478662682)
,p_plugin_type=>'REGION TYPE'
,p_name=>'COM.INFORTRIBUTOS.FORMULARIO_DECLARACION'
,p_display_name=>unistr('Formulario Declaraci\00F3n')
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('REGION TYPE','COM.INFORTRIBUTOS.FORMULARIO_DECLARACION'),'#IMAGE_PREFIX#plugins/infortributos/com.infortributos.formulario_declaracion/')
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#javascript/infortributos/js/utilidades.js',
'#IMAGE_PREFIX#javascript/infortributos/js/accounting.min.js',
'#PLUGIN_FILES#1.0/vendor/tooltipster/dist/js/tooltipster.bundle.min.js',
'#PLUGIN_FILES#1.0/js/select2.min.js',
'#PLUGIN_FILES#1.0/js/funciones.js',
'#PLUGIN_FILES#1.0/js/app.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#1.0/css/select2.min.css',
'#PLUGIN_FILES#1.0/vendor/tooltipster/dist/css/tooltipster.bundle.min.css',
'#PLUGIN_FILES#1.0/vendor/tooltipster/dist/css/plugins/tooltipster/sideTip/themes/tooltipster-sideTip-light.min.css',
'#PLUGIN_FILES#1.0/css/tabs.css?version=3',
'#PLUGIN_FILES#1.0/css/Collapsibles.css?version=1'))
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_ge_render(p_region              in apex_plugin.t_region,',
'                       p_plugin              in apex_plugin.t_plugin,',
'                       p_is_printer_friendly in boolean) return apex_plugin.t_region_render_result as ',
'    ',
'    v_result            apex_plugin.t_region_render_result;',
'    ',
'    v_ulr_srvcio        varchar2(1000) := v(''F_DRCCION_SRVDOR_PRVDO'') || p_region.attribute_11;',
'    l_clob              clob;',
'    v_json              json_object_t;    ',
'    v_id_impsto         number;',
'    v_id_impsto_sbmpsto number;',
'    v_json_slda         clob;',
'begin',
'    apex_web_service.g_request_headers(1).name := ''Content-Type'';  ',
'    apex_web_service.g_request_headers(1).value := ''application/x-www-form-urlencoded'';',
'    v_json := json_object_t.parse(apex_web_service.make_rest_request(p_url          => v_ulr_srvcio,',
'                                                                     p_http_method  => ''POST'',',
'                                                                     p_parm_name    => apex_util.string_to_table(''p_accion:p_id_dclrcion_vgncia_frmlrio''),',
'                                                                     p_parm_value   => apex_util.string_to_table(''render:'' || v(p_region.attribute_01))));',
'    ',
'    if (v_json.get_number(''o_cdgo_rspsta'') = 0) then',
'        --Generamos el JSON de configuracion',
'        apex_json.initialize_clob_output;',
'        apex_json.open_object;',
'        apex_json.write(''regionId'', p_region.static_id);',
'        apex_json.write(''ajaxID'', apex_plugin.get_ajax_identifier);',
'        apex_json.write(''idVigenciaFormulario'', v(p_region.attribute_01));',
'        apex_json.write(''identificadorDeclaracion'', p_region.attribute_02);',
'        apex_json.write(''idDeclaracion'', v(p_region.attribute_02));',
'        apex_json.write(''validaCamposRequeridos'', p_region.attribute_03);',
'        apex_json.write(''ejecutaValidaciones'', p_region.attribute_04);',
'        apex_json.write(''validaNumeroMinFilas'', p_region.attribute_05);',
'        apex_json.write(''aplicaRestricciones'', p_region.attribute_06);',
'        apex_json.write(''registraDeclaracion'', p_region.attribute_07);',
'        apex_json.write(''SujetoTributo'', v(p_region.attribute_08));',
'        apex_json.write(''idntfccion'', v(p_region.attribute_09));',
'        apex_json.write(''urlPagina'', p_region.attribute_10);',
'        apex_json.write(''urlServicio'', v(''F_DRCCION_SRVDOR_PBLCO'') || p_region.attribute_11); --v_ulr_srvcio',
'        apex_json.write(''idCnddtoVgncia'', v(p_region.attribute_12));',
'        apex_json.write(''indicadorFiscalizacion'', p_region.attribute_13);',
'        apex_json.write(''id_impsto'', v_json.get_number(''o_id_impsto''));',
'        apex_json.write(''id_impsto_sbmpsto'', v_json.get_number(''o_id_impsto_sbmpsto''));',
'        apex_json.write(''codigoCliente'', v(''F_CDGO_CLNTE''));',
'        apex_json.write(''idUsuario'', v(''F_ID_USRIO''));',
'        apex_json.close_object;',
'        v_json_slda := apex_json.get_clob_output;',
'        apex_json.free_output;',
'        ',
'        apex_javascript.add_onload_code (p_code => ''formularioDeclaracion.initialize(''||v_json_slda||'');'');',
'    end if;',
'    ',
'    return v_result;',
' ',
'end;'))
,p_api_version=>2
,p_render_function=>'fnc_ge_render'
,p_substitute_attributes=>true
,p_reference_id=>76225589897143230
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94703791344580380)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>10
,p_prompt=>'Identificador Vigencia Formulario'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94704133457580381)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>20
,p_prompt=>unistr('Identificador Asociado a la Declaraci\00F3n')
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94704585159580381)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Valida Campos Requeridos'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94704991466580381)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>40
,p_prompt=>'Ejecuta Validaciones'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94705380810580381)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>50
,p_prompt=>unistr('Valida Numero M\00EDnimo de Filas')
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94705775380580381)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>60
,p_prompt=>'Aplica Restricciones'
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94706173860580382)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>70
,p_prompt=>unistr('Registra Declaraci\00F3n')
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'Y'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94706565368580382)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>80
,p_prompt=>'Identificador asociado al  Sujeto Impuesto'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_supported_ui_types=>'DESKTOP:JQM_SMARTPHONE'
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94706919330580382)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>90
,p_prompt=>unistr('Identificador asociado a la Identificaci\00F3n del Sujeto')
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>true
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94707300813580388)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>100
,p_prompt=>unistr('Pagina Confirmaci\00F3n Declaraci\00F3n')
,p_attribute_type=>'LINK'
,p_is_required=>false
,p_is_translatable=>false
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94707791134580388)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>110
,p_prompt=>'Modulo Servicio'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_is_translatable=>false
,p_examples=>'http://192.168.11.34:8034/ords/api/declaraciones/gestion'
,p_help_text=>unistr('Direcci\00F3n general del servicio donde se encuentran publicadas los procesos necesarios para la gesti\00F3n de una declaraci\00F3n.')
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94708546846580389)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>130
,p_prompt=>unistr('Identificador asociado al proceso de fiscalizaci\00F3n')
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>unistr('Identificaci\00F3n del periodo desde el proceso de fiscalizaci\00F3n que origina la declaraci\00F3n.')
);
wwv_flow_api.create_plugin_attribute(
 p_id=>wwv_flow_api.id(94708105536580389)
,p_plugin_id=>wwv_flow_api.id(94586007478662682)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>120
,p_prompt=>unistr('Fiscalizaci\00F3n')
,p_attribute_type=>'CHECKBOX'
,p_is_required=>false
,p_default_value=>'N'
,p_is_translatable=>false
);
end;
/
