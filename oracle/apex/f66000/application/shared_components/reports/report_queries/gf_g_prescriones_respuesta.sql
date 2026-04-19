prompt --application/shared_components/reports/report_queries/gf_g_prescriones_respuesta
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(82225324078779175)
,p_name=>'gf_g_prescriones_respuesta'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select      a.id_acto',
'           ,a.dcmnto ',
'from        gf_g_prescripciones     a',
'where       a.cdgo_clnte    =       :F_CDGO_CLNTE',
'and         a.id_acto       =       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''id_acto'');'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_prescriones_respuesta'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(127219276868221570)
,p_shared_query_id=>wwv_flow_api.id(82225324078779175)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('--Consulta que trae datos de proyecci\00F3n del documento'),
'select      a.id_acto,',
'           a.dcmnto,',
'           a.id_usrio_prycto,',
'           d.prmer_nmbre||'' ''||d.prmer_aplldo usrio_prycto,',
'           a.id_usrio_atrzo,',
'           g.prmer_nmbre||'' ''||g.prmer_aplldo usrio_atrzo',
'from        gf_g_prscrpcns_dcmnto       a',
'inner join  sg_g_usuarios               b   on  b.id_usrio  =   a.id_usrio_prycto',
'--inner join  df_c_funcionarios           c   on  c.id_fncnrio=   b.id_fncnrio',
'inner join  si_c_terceros               d   on  d.id_trcro  =   b.id_trcro',
'inner join  sg_g_usuarios               e   on  e.id_usrio  =   a.id_usrio_atrzo',
'--inner join  df_c_funcionarios           f   on  f.id_fncnrio=   e.id_fncnrio',
'inner join  si_c_terceros               g   on  g.id_trcro  =   e.id_trcro',
'where       a.id_dcmnto =   pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_dcmnto'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(127219433457221570)
,p_shared_query_id=>wwv_flow_api.id(82225324078779175)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta que trae datos del funcionario que firma el acto',
'select      d.prmer_nmbre',
'           ,d.sgndo_nmbre',
'           ,d.prmer_aplldo',
'           ,d.sgndo_aplldo',
'from        gn_g_actos                  a',
'inner join  gn_d_actos_funcionario_frma b   on  b.id_acto_fncnrio_frma  =   a.id_fncnrio_frma',
'inner join  df_c_funcionarios           c   on  c.id_fncnrio            =   b.id_fncnrio',
'inner join  si_c_terceros               d   on  d.id_trcro              =   c.id_trcro',
'where       a.id_acto       =       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_acto'');'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(127219614639221570)
,p_shared_query_id=>wwv_flow_api.id(82225324078779175)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('-- Encabezado y Pie de P\00E1gina'),
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MON/YYYY HH:MI:SS AM'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''P_ID_IMPSTO'' ) )nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''P_ID_RPRTE'' ) )nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'';'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(127219805136221570)
,p_shared_query_id=>wwv_flow_api.id(82225324078779175)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Fecha del documento',
'/*select      a.nmro_acto_dsplay,',
'           to_char(a.fcha, ''FM DD "DE" MONTH "DEL "YYYY'') fcha',
'from        gn_g_actos      a',
'where       a.id_acto       =       pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_acto'');*/',
'',
'select a.nmro_prscrpcion    nmro_acto_dsplay',
'       , to_char(c.fcha, ''FM DD "DE" MONTH "DEL "YYYY'') fcha',
'from gf_g_prescripciones    a',
'join gf_g_prscrpcns_dcmnto b on a.id_prscrpcion = b.id_prscrpcion',
'join gn_g_actos            c on b.id_acto = c.id_acto     ',
'where c.id_acto =    pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :p2_xml , p_nodo => ''id_acto'')'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(127220097645221570)
,p_shared_query_id=>wwv_flow_api.id(82225324078779175)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Logos',
'select (select pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => c.file_blob)',
'          from df_c_imagenes_cliente c',
'         where c.cdgo_clnte = a.cdgo_clnte',
'           and c.cdgo_imgen_clnte = ''BAN'') banner,',
'       (select pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64(p_blob => d.file_blob)',
'          from df_c_imagenes_cliente d',
'         where d.cdgo_clnte = a.cdgo_clnte',
'           and d.cdgo_imgen_clnte = ''FOT'') footer',
'  from  df_s_clientes a',
' where a.cdgo_clnte = :F_CDGO_CLNTE'))
);
end;
/
