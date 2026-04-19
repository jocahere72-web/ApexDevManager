prompt --application/shared_components/reports/report_queries/fisca_req_ordinario_temp
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(135516545717247257)
,p_name=>'fisca_req_ordinario_temp'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.dcmnto',
'from TEMP_REQ_INFORMCION t',
'where t.nmro_acto = json_value(:P37_JSON, ''$.nmro_acto'');'))
,p_format=>'PDF'
,p_output_file_name=>'fisca_req_ordinario_temp'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(135517494283366663)
,p_shared_query_id=>wwv_flow_api.id(135516545717247257)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.dcmnto',
'from TEMP_REQ_INFORMCION t',
'where t.nmro_acto = json_value(:P37_JSON, ''$.nmro_acto'');'))
);
end;
/
