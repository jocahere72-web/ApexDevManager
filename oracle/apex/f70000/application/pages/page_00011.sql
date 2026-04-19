prompt --application/pages/page_00011
begin
wwv_flow_api.create_page(
 p_id=>11
,p_user_interface_id=>wwv_flow_api.id(164114460002707812)
,p_name=>'Descargar Excel'
,p_step_title=>'Descargar Excel'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_last_updated_by=>'ECASTILLO'
,p_last_upd_yyyymmddhh24miss=>'20180615081806'
);
wwv_flow_api.create_page_process(
 p_id=>wwv_flow_api.id(175074528486017393)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generar Excel'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'v_source_blob bfile;',
'v_destino_blob blob := empty_blob();',
'',
'begin',
'    as_xlsx.query2sheet( :F_SQL );',
'                     ',
'    as_xlsx.save( ''LOGS'', :F_NMBRE_ARCHVO||''.xlsx'' );',
'    ',
'    dbms_lob.createtemporary(v_destino_blob, true);',
'    ',
'    v_source_blob := BFILENAME(''LOGS'', :F_NMBRE_ARCHVO||''.xlsx'');',
'    ',
'    DBMS_LOB.OPEN(v_source_blob, DBMS_LOB.LOB_READONLY);',
'        ',
'    DBMS_LOB.LoadFromFile( DEST_LOB => v_destino_blob,',
'                           SRC_LOB  => v_source_blob,',
'                           AMOUNT   => DBMS_LOB.GETLENGTH(v_source_blob));',
'                    ',
'    DBMS_LOB.CLOSE(v_source_blob);',
'     ',
'    OWA_UTIL.mime_header (''application/octet'', FALSE);',
'    ',
'    htp.p(''Content-length: '' || DBMS_LOB.GETLENGTH(v_destino_blob));',
'    htp.p (''Content-Disposition: attachment; filename="'' ||:F_NMBRE_ARCHVO||''.xlsx''|| ''"'');',
'    ',
'    OWA_UTIL.http_header_close;',
'    ',
'    wpg_docload.download_file( v_destino_blob );',
'    dbms_lob.freetemporary(v_destino_blob);',
'    ',
'    UTL_FILE.FREMOVE(''LOGS'', :F_NMBRE_ARCHVO||''.xlsx'');',
'     ',
'    exception',
'        when others then',
'            UTL_FILE.FREMOVE(''LOGS'', :F_NMBRE_ARCHVO||''.xlsx'');',
'            raise_application_error(-20001, ''Se ha producido un error - ''||SQLCODE||'' -ERROR- ''||SQLERRM);',
'    ',
'end;'))
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
);
end;
/
