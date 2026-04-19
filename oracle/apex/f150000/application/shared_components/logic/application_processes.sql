prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(55828305622825039)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'configuracionPortal'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_json.open_object;',
'apex_json.write(''apiServer'', :F_DRCCION_SRVDOR_PBLCO);',
'apex_json.write(''cliente'', :F_CDGO_CLNTE);',
'apex_json.write(''tercero'', :F_NMBRE_USRIO);',
'apex_json.write(''token'', :F_ID_USRIO_TKEN); ',
' 	',
'--:F_DRCCION_SRVDOR',
'apex_json.close_object;'))
);
end;
/
