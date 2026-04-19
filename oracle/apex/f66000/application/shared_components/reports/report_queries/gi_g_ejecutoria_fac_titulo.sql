prompt --application/shared_components/reports/report_queries/gi_g_ejecutoria_fac_titulo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(114139953822424302)
,p_name=>'gi_g_ejecutoria_fac_titulo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.* from LISTADO_EJECUTORIA t',
'where t.id = 1'))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_ejecutoria_fac_titulo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(114140751678434948)
,p_shared_query_id=>wwv_flow_api.id(114139953822424302)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select t.dcmnto, upper(json_value(:P37_JSON,''$.nmbre_rprte'')) as nmbre_rprte from LISTADO_EJECUTORIA t',
'where t.id = json_value(:P37_JSON,''$.id_ejctria'')'))
);
end;
/
