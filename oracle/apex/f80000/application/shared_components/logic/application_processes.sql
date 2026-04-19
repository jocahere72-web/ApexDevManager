prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(35179803467717232)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set_Session'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_accion_ajax varchar2(10) := apex_application.g_f01(1);',
'    v_identificador varchar2(30) := apex_application.g_f02(1); ',
'begin',
'    ',
'    apex_json.initialize_output( p_http_cache => false ); ',
'    owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache'');',
'    owa_util.http_header_close;',
'    apex_json.open_object();',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''valor'', apex_application.g_f03(1)); ',
'    apex_util.set_session_state(v_identificador,  apex_application.g_f03(1));',
'    apex_json.close_all();',
'    ',
'exception when others then',
'          apex_json.open_object();',
'          apex_json.write(''type'', ''ERROR'');',
'          apex_util.set_session_state(v_identificador,  apex_application.g_f03(1));',
'          apex_json.close_all();',
'end;'))
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
end;
/
