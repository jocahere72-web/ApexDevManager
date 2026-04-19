prompt --application/shared_components/reports/report_queries/gf_g_aplicacion_acuerdo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(95827595827961586)
,p_name=>'gf_g_aplicacion_acuerdo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_IMPSTO'' ) )nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_RPRTE'' ) )nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_aplicacion_acuerdo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14739959920165147)
,p_shared_query_id=>wwv_flow_api.id(95827595827961586)
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
 p_id=>wwv_flow_api.id(14740156107165147)
,p_shared_query_id=>wwv_flow_api.id(95827595827961586)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--obtener html',
'select TO_CLOB(b.dcmnto) dcmnto, a.nmro_acto_dsplay, a.cdgo_cnvnio_estdo, initcap(to_char(sysdate, ''FMMONTH DD''))||'' de ''||to_char(sysdate, ''YYYY'') fcha_hoy',
'  from gf_g_convenios_documentos b',
'  join v_gf_g_convenios a',
'    on a.id_cnvnio = b.id_cnvnio',
' where b.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.id_cnvnio  = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_cnvnio'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(14740324408165147)
,p_shared_query_id=>wwv_flow_api.id(95827595827961586)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Obtener el funcionario Firma del Acto',
'select c.nmbre_trcro, d.nmbre_ofcna, e.nmbre_crgo',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios c on a.id_fncnrio = c.id_fncnrio',
'  join df_c_oficinas d on c.id_ofcna = d.id_ofcna',
'  join df_c_cargos e on c.id_crgo = e.id_crgo',
' where b.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.cdgo_acto_tpo = ''AAA'''))
);
end;
/
