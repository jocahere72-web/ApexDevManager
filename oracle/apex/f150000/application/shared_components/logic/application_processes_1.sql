prompt --application/shared_components/logic/application_processes
begin
wwv_flow_api.create_flow_process(
 p_id=>wwv_flow_api.id(59656262037391276)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'cerrarSesion'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_cdgo_clnte number := :F_CDGO_CLNTE;',
'    v_url        varchar2(4000);',
'    v_app        number := :APP_ID;',
'    ',
'begin',
'    apex_json.open_object;',
'    ',
'    begin',
'        apex_session.delete_session;',
'    exception',
'        when others then',
'            null;',
'    end;',
'    ',
'    v_url := apex_util.prepare_url( p_url => ''f?p='' || v_app || '':101:::::F_CDGO_CLNTE:''|| v_cdgo_clnte);',
'   ',
'    apex_json.write(''type'', ''OK'');',
'    apex_json.write(''url'', v_url);',
'    apex_json.close_object;',
'exception',
'    when others then',
'        apex_json.write(''type'', ''ERROR'');',
'        apex_json.write(''msg'' , sqlerrm);',
'        apex_json.close_object;',
'end;'))
);
end;
/
