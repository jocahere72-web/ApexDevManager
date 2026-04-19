prompt --application/shared_components/reports/report_queries/gf_g_cn_rechazo_acuerdo_pago
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(95400250864463464)
,p_name=>'gf_g_cn_rechazo_acuerdo_pago'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
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
,p_report_layout_id=>wwv_flow_api.id(122170413727503366)
,p_format=>'PDF'
,p_output_file_name=>'gf_g_cn_rechazo_acuerdo_pago'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24027888476067583)
,p_shared_query_id=>wwv_flow_api.id(95400250864463464)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(24028097348067584)
,p_shared_query_id=>wwv_flow_api.id(95400250864463464)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.dcmnto || '' <p>&nbsp;</p> <a>___________________________________<br>'' || ',
'                       d.nmbre_trcro || ''<br>'' || ',
'                       d.nmbre_ofcna || ''<br>'' || ',
'                       d.nmbre_crgo  || ''</a>'' dcmnto',
'        , b.nmro_acto_dsplay',
'        , initcap(to_char(sysdate, ''FMMONTH DD''))||'' de ''||to_char(sysdate, ''YYYY'') fcha_hoy',
'     from gf_g_convenios_documentos    a',
'     join v_gf_g_convenios             b on a.id_cnvnio        = b.id_cnvnio',
'     join gn_g_actos                   c on b.id_acto          = c.id_acto',
'     join v_df_c_funcionarios          d on c.id_fncnrio_frma  = d.id_fncnrio',
' where a.cdgo_clnte                    = :F_CDGO_CLNTE',
'   and a.id_cnvnio                     = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_cnvnio'')',
'   and a.id_plntlla                    = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML, p_nodo => ''id_plntlla'');'))
);
end;
/
