prompt --application/shared_components/reports/report_queries/gf_g_rechazo_reversion_acuerdo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(34687456946605630)
,p_name=>'gf_g_rechazo_reversion_acuerdo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_IMPSTO'' ) )nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_RPRTE'' ) )nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_report_layout_id=>wwv_flow_api.id(34815532927828948)
,p_format=>'PDF'
,p_output_file_name=>'gf_g_rechazo_reversion_acuerdo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(34817457242831409)
,p_shared_query_id=>wwv_flow_api.id(34687456946605630)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.dcmnto,-- || '' <p>&nbsp;</p> <p>___________________________________</p><p>'' || b.nmbre_trcro ||''</p><p>'' || b.cdgo_idntfccion_tpo || '' '' || b.idntfccion || ''</p>'' dcmnto,',
'       b.nmro_acto_dsplay,',
'       initcap(to_char(sysdate, ''FMMONTH DD''))||'' de ''||to_char(sysdate, ''YYYY'') fcha_hoy',
'  from gf_g_convenios_documentos a',
'  join v_gf_g_convenios_reversion b on a.id_cnvnio = b.id_cnvnio',
'  --join v_gn_g_actos b on b.cdgo_acto_orgen = ''CNV'' and id_orgen = a.id_cnvnio',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_cnvnio  = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_cnvnio'')',
'   and a.id_plntlla = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_plntlla'');',
'  '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(34817632892831411)
,p_shared_query_id=>wwv_flow_api.id(34687456946605630)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'       pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'       to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'       :F_IP as ipaddr,',
'       (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_IMPSTO'' ) )nmbre_impsto,',
'       (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_RPRTE'' ) )nmbre_rpte,',
'       :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
