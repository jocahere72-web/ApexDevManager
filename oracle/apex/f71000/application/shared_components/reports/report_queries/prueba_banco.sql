prompt --application/shared_components/reports/report_queries/prueba_banco
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(34655032627847775)
,p_name=>'prueba_banco'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_bnco , c.id_bnco_cnta , b.nmbre_bnco from df_c_bancos b join df_c_bancos_cuenta c on b.id_bnco = c.id_bnco',
'order by b.id_bnco'))
,p_format=>'PDF'
,p_output_file_name=>'prueba_banco'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72492677214974509)
,p_shared_query_id=>wwv_flow_api.id(34655032627847775)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select b.id_bnco, b.nmbre_bnco ',
'  from df_c_bancos b ',
'order by b.id_bnco'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(72492884573974509)
,p_shared_query_id=>wwv_flow_api.id(34655032627847775)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select c.id_bnco_cnta ',
'  from df_c_bancos b ',
'  join df_c_bancos_cuenta c on b.id_bnco = c.id_bnco',
'order by b.id_bnco'))
);
end;
/
