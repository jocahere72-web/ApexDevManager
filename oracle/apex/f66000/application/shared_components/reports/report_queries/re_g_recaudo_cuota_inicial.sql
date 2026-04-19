prompt --application/shared_components/reports/report_queries/re_g_recaudo_cuota_inicial
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(98368315466964050)
,p_name=>'re_g_recaudo_cuota_inicial'
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
,p_report_layout_id=>wwv_flow_api.id(98423308060360441)
,p_format=>'PDF'
,p_output_file_name=>'re_g_recaudo_cuota_inicial'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(98424095744366982)
,p_shared_query_id=>wwv_flow_api.id(98368315466964050)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(98424284722366982)
,p_shared_query_id=>wwv_flow_api.id(98368315466964050)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select a.nmro_cnvnio, to_char(a.fcha_slctud, ''DD/MM/YYYY'') fcha_cnvnio,',
'       a.idntfccion_sjto, a.nmbre_slctnte, b.nmro_dcmnto,',
'       ''$ ''|| to_char(b.vlor_ttal_dcmnto, ''FM999G999G999'')ttal_cta,',
'       ''$ ''|| to_char(a.ttal_cnvnio, ''FM999G999G999'')ttal_cnvnio,  ',
'       pkg_gn_generalidades.fnc_cl_formato_texto(b.idntfccion_sjto,''XX-XX-XX-XX-XXXX-XXXX-X-XX-XX-XXXX'',''-'')idntfccion,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_INCIO'') fcha_incio,',
'       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_FIN'') fcha_fin',
'  from v_gf_g_convenios a',
'  join v_re_g_documentos b',
'    on a.id_dcmnto_cta_incial = b.id_dcmnto',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and (a.fcha_slctud between pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_INCIO'') and pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_FIN'') ',
'        or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_INCIO'') is null)',
' order by a.id_cnvnio;'))
);
end;
/
