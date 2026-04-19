prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(137314173277625666)
,p_process_sequence=>1
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Obtener IP'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  v_ip varchar2(30);',
'begin  ',
'  v_ip := owa_util.get_cgi_env(''REMOTE_ADDR'');',
' -- htp.p(''Client address is: '' || v_ip); ',
'  ',
'  :F_IP := v_ip;',
'  ',
'end;'))
);
end;
/
