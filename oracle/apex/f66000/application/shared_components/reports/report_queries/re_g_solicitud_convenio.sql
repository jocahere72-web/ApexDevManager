prompt --application/shared_components/reports/report_queries/re_g_solicitud_convenio
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(72670304320319054)
,p_name=>'re_g_solicitud_convenio'
,p_query_text=>'select * from v_df_s_clientes where cdgo_clnte = 1;'
,p_report_layout_id=>wwv_flow_api.id(72773383837810650)
,p_format=>'PDF'
,p_output_file_name=>'re_g_solicitud_convenio'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(84215531736298559)
,p_shared_query_id=>wwv_flow_api.id(72670304320319054)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select initcap(c.nmbre_clnte) nmbre_clnte,',
'       initcap(c.nmbre_mncpio) nmbre_mncpio,',
'       to_char(sysdate,''FMDD Month "de" YYYY'', ''nls_date_language=spanish'') fecha_hoy,',
'       initcap(f.nmbre_crgo) nmbre_crgo,',
'       f.nmbre_trcro',
'  from v_df_s_clientes c',
'  join v_df_c_funcionarios f',
'    on f.cdgo_clnte = c.cdgo_clnte',
' where c.cdgo_clnte = :F_CDGO_CLNTE',
'   and f.idntfccion = 1143340846'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(84215737136298559)
,p_shared_query_id=>wwv_flow_api.id(72670304320319054)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select s.nmbre_impsto_sbmpsto as subimpuesto ',
'  from v_df_i_impuestos_subimpuesto s',
' where s.cdgo_clnte = :F_CDGO_CLNTE',
'   and s.id_impsto =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_impsto'')',
'   and s.id_impsto_sbmpsto =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_impsto_sbmpsto'')'))
);
end;
/
