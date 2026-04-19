prompt --application/shared_components/reports/report_queries/gi_g_acto_determinacion
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(37254148636110106)
,p_name=>'gi_g_acto_determinacion'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_format=>'PDF'
,p_output_file_name=>'gi_g_acto_determinacion'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(39004361933515703)
,p_shared_query_id=>wwv_flow_api.id(37254148636110106)
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
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(39004502995515703)
,p_shared_query_id=>wwv_flow_api.id(37254148636110106)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Documento -- ',
'     select a.dcmnto',
'       from gi_g_determinaciones           a',
'  --left join gi_g_determinaciones_dcmnto    b on a.id_dtrmncion = b.id_dtrmncion',
'  --left join re_g_documentos                c on b.id_dcmnto    = c.id_dcmnto',
'  left join gn_g_actos                     d on a.id_acto      = d.id_acto',
'      where a.id_dtrmncion_lte    =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_DTRMNCION_LTE'' ) ',
'        and a.id_dtrmncion        =  nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_DTRMNCION'' ), a.id_dtrmncion )',
'        and (/*(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_GNRCION_TPO'' )  = ''DCM''',
'                and  c.nmro_dcmnto  between nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_RANGO_INICIO'' ), c.nmro_dcmnto )',
'                                        and nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_RANGO_FIN'' ), c.nmro_dcmnto ))',
'            or */',
'            (pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_GNRCION_TPO'' )  = ''ACT'' ',
'                and d.nmro_acto  between nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_RANGO_INICIO'' ), d.nmro_acto )',
'                                     and nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_RANGO_FIN'' ), d.nmro_acto ))',
'            or (pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_GNRCION_TPO'' ) is  null)    ',
'            ) '))
);
end;
/
