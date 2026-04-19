prompt --application/shared_components/reports/report_queries/mc_g_secuestre_documentos
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(16498476415538574)
,p_name=>'mc_g_secuestre_documentos'
,p_query_text=>'select upper(b.nmbre_clnte)nmbre_clnte, upper(b.slgan)slgan, pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan, to_char(systimestamp, ''DD/MON/YYYY'') HOY, :F_IP as ipaddr, :F_NMBRE_USRIO as Usuario, a.file_mimet'
||'ype from df_c_imagenes_cliente a join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) where a.cdgo_clnte = :F_CDGO_CLNTE and a.cdgo_imgen_clnte = ''L_E'' '
,p_format=>'PDF'
,p_output_file_name=>'mc_g_secuestre_documentos'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(16498602234538574)
,p_shared_query_id=>wwv_flow_api.id(16498476415538574)
,p_sql_statement=>'select upper(b.nmbre_clnte)nmbre_clnte, upper(b.slgan)slgan, pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan, to_char(systimestamp, ''DD/MON/YYYY'') HOY, :F_IP as ipaddr, :F_NMBRE_USRIO as Usuario, a.file_mimet'
||'ype from df_c_imagenes_cliente a join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) where a.cdgo_clnte = :F_CDGO_CLNTE and a.cdgo_imgen_clnte = ''L_E'' '
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(16498822298538574)
,p_shared_query_id=>wwv_flow_api.id(16498476415538574)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dcmnto,to_char(a.fcha_acto, ''FMMonth DD "de" YYYY'') fcha_acto, a.nmro_acto ',
'from mc_g_secuestre_documentos a',
'where a.id_scstre_dcmnto = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_scstre_dcmnto'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(16499047435538574)
,p_shared_query_id=>wwv_flow_api.id(16498476415538574)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- PIE DE PAGINA --',
'select c.nmbre_trcro, d.nmbre_ofcna, e.nmbre_crgo',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios c on a.id_fncnrio = c.id_fncnrio',
'  join df_c_oficinas d on c.id_ofcna = d.id_ofcna',
'  join df_c_cargos e on c.id_crgo = e.id_crgo',
'  join gn_g_actos f on f.ID_ACTO_TPO = b.ID_ACTO_TPO',
'  join MC_G_SECUESTRE_DOCUMENTOS g on g.ID_ACTO = f.ID_ACTO ',
' where b.cdgo_clnte = :F_CDGO_CLNTE',
'   and g.ID_SCSTRE_DCMNTO = pkg_gn_generalidades.fnc_ca_extract_value(:P2_XML, ''id_scstre_dcmnto'');'))
);
end;
/
