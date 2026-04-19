prompt --application/shared_components/reports/report_queries/gf_g_rechazo_modificacion
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(120326266018705262)
,p_name=>'gf_g_rechazo_modificacion'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''p_id_impsto'' ) )nmbre_impsto,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_report_layout_id=>wwv_flow_api.id(121896370870104588)
,p_format=>'PDF'
,p_output_file_name=>'gf_g_rechazo_modificacion'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121896979991105843)
,p_shared_query_id=>wwv_flow_api.id(120326266018705262)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'       a.file_mimetype,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''p_id_impsto'' ) )nmbre_impsto,',
'       upper(b.nmbre_ofcna) nmbre_ofcna        ',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121897105406105843)
,p_shared_query_id=>wwv_flow_api.id(120326266018705262)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--obtener html',
'select b.dcmnto,',
'       initcap(to_char(sysdate, ''FMMONTH DD''))||'' de ''||to_char(sysdate, ''YYYY'') fcha_hoy,',
'       a.nmro_acto_dsplay',
'  from v_gf_g_convenios_modificacion a',
'  join gf_g_convenios_documentos b on a.id_cnvnio = b.id_cnvnio',
' where b.cdgo_clnte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''cod_clnte'')',
'   and b.id_cnvnio  = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_cnvnio'')',
'   and b.id_plntlla = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_plntlla'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121897327879105843)
,p_shared_query_id=>wwv_flow_api.id(120326266018705262)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Obtener el funcionario Firma del Acto',
'select c.nmbre_trcro, d.nmbre_ofcna, e.nmbre_crgo',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios c on a.id_fncnrio = c.id_fncnrio',
'  join df_c_oficinas d on c.id_ofcna = d.id_ofcna',
'  join df_c_cargos e on c.id_crgo = e.id_crgo',
' where b.cdgo_clnte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''cod_clnte'')',
'   and b.cdgo_acto_tpo = ''AMA'''))
);
end;
/
