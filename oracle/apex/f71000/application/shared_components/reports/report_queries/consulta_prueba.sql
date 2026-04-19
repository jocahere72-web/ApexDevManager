prompt --application/shared_components/reports/report_queries/consulta_prueba
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(112731817803460868)
,p_name=>'consulta_prueba'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  rtrim(xmlelement(e, pkg_gf_prescripcion.fnc_ca_prescrpcns_vgncias_sjto(p_cdgo_clnte => 6, p_id_prscrpcion => 112)).extract (''//text()'').GetClobVal())',
'as d_html',
'from    dual;'))
,p_format=>'PDF'
,p_output_file_name=>'consulta_prueba'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(112773438295883302)
,p_shared_query_id=>wwv_flow_api.id(112731817803460868)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  pkg_gf_prescripcion.fnc_ca_prescrpcns_vgncias_sjto(p_cdgo_clnte => 6, p_id_prscrpcion => 112)',
'as d_html',
'from    dual;'))
);
end;
/
