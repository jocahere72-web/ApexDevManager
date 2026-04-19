prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(36796315026125442)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'imprimirReporte'
,p_process_sql_clob=>'null;'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
);
end;
/
