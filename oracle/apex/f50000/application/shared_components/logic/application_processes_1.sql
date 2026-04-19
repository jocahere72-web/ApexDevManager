prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(34721420558489809)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Prueba'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    /*v_accion_ajax varchar2(10) := apex_application.g_f01(1);*/',
'    v_url varchar2(4000);',
'begin',
'    v_url := apex_util.prepare_url( ''f?p=80000:11''||'':''|| v(''app_session'') ||''::NO:P_ITEMS:P_VALUES'');',
'    apex_json.initialize_output( p_http_cache => false ); ',
'    owa_util.mime_header(''application/json'', false);',
'    htp.p(''cache-control: no-cache'');',
'    htp.p(''pragma: no-cache'');',
'    owa_util.http_header_close;',
'    apex_json.open_object(); ',
'    apex_json.write(''cliente'', ''assasasaas'');  ',
'    apex_json.write(''prueba'', ''asaasas'');  ',
'    apex_json.write(''v_url'', v_url);  ',
'    ',
'    apex_json.close_all();',
'end;'))
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
end;
/
