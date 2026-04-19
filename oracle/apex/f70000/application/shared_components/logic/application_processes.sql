prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(174898177505146360)
,p_process_sequence=>1
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DOWNLOAD_EXCEL'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'export_excel_pkg.print_report (:t_region_id, :t_excel_name, :t_page);',
'END;'))
,p_process_when=>'DOWNLOAD_EXCEL'
,p_process_when_type=>'REQUEST_EQUALS_CONDITION'
);
end;
/
