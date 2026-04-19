prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(87293887938516501)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Imprimir_Multiples_Reportes'
,p_process_sql_clob=>'pkg_gn_generalidades.prc_ge_reportes_multiples;'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_process_comment=>unistr('Proceso para la descargas m\00FAltiples de reportes.')
);
end;
/
