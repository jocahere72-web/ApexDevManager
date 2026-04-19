prompt --application/shared_components/plugins/process_type/proceso_workflow
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(79062577368231248)
,p_plugin_type=>'PROCESS TYPE'
,p_name=>'PROCESO_WORKFLOW'
,p_display_name=>'Proceso_WorkFlow'
,p_supported_ui_types=>'DESKTOP'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('PROCESS TYPE','PROCESO_WORKFLOW'),'')
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function fnc_process_exec(',
'                            p_process in apex_plugin.t_process,',
'                            p_plugin  in apex_plugin.t_plugin )',
'    return apex_plugin.t_process_exec_result ',
'    is',
'    ',
'        v_t_process_exec_result    apex_plugin.t_process_exec_result;',
'        v_id_fljo_trea             wf_g_instancias_transicion.id_fljo_trea_orgen%type  := :F_ID_FLJO_TREA ;',
'        v_id_fljo_trea_dstno       wf_g_instancias_transicion.id_fljo_trea_orgen%type  := :F_ID_FLJO_TREA ;',
'        v_id_instncia_fljo         wf_g_instancias_transicion.id_instncia_fljo%type    := :F_ID_INSTNCIA_FLJO;',
'        v_mnsje                 varchar2(4000);',
'        v_type                  varchar2(1);',
'        v_error	                varchar2(4000);',
'        v_json                  clob;',
'    begin',
'        begin',
'            ',
'            select json_object(key ''param'' value json_arrayagg(json_object(key ''param_or'' value a.prmtro_orgen, ',
'                                                                           key ''param_dt'' value a.prmtro_dstno, ',
'                                                                           key ''valor'' value v(a.prmtro_orgen) )) returning clob )',
'              into v_json',
'              from wf_d_flujos_trnscion_prmtro a',
'             where id_fljo_trnscion in ( select id_fljo_trnscion',
'                                           from wf_d_flujos_transicion ',
'                                          where id_fljo_trea = v_id_fljo_trea ',
'                                        )',
'               and actvo = ''S'';',
'                ',
'            /*pkg_pl_workflow_1_0.prc_rg_instancias_transicion(  p_id_instncia_fljo => v_id_instncia_fljo',
'                                                          , p_id_fljo_trea     => v_id_fljo_trea',
'                                                          , p_json             => ''[]''',
'                                                          , o_type             => v_type',
'                                                          , o_mnsje            => v_mnsje',
'                                                          , o_id_fljo_trea     => v_id_fljo_trea_dstno',
'                                                          , o_error	           => v_error);*/',
'        ',
'           pkg_pl_workflow_1_0.prc_rg_instancias_transicion(',
'                                                                p_id_instncia_fljo => v_id_instncia_fljo',
'                                                              , p_id_fljo_trea     => v_id_fljo_trea',
'                                                              , p_json             => v_json',
'                                                              , p_print_apex       => false',
'                                                              , o_error            => v_error );',
'          ',
'          ',
'        exception ',
'            when others then',
'                null;',
'        end;',
'        ',
'        if  v_error = ''N'' then -- v_type = ''N'' then --',
'            v_t_process_exec_result.success_message := ''Siguiente tarea ejecutada con Exito!!! '';',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', NULL);',
'        else ',
'            apex_util.set_session_state(''F_ID_FLJO_TREA'', v_id_fljo_trea);',
'        end if;',
'        ',
'        ',
'    return v_t_process_exec_result;',
'    ',
'end fnc_process_exec;'))
,p_api_version=>2
,p_execution_function=>'fnc_process_exec'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
);
end;
/
