prompt --application/shared_components/reports/report_queries/pq_g_rprte_rdcdo_ttl
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(7230737569049381)
,p_name=>'pq_g_rprte_rdcdo_ttl'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta Basica',
'select upper(b.nmbre_clnte)nmbre_clnte',
'       ,upper(b.slgan)slgan',
'       ,pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'       ,to_char(systimestamp, ''DD/MM/YYYY'') HOY',
'       ,:F_IP as ipaddr',
'       ,:F_NMBRE_USRIO as Usuario     ',
'       ,a.file_mimetype',
'      ,pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO'')          as fcha_incial',
'      ,pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_FIN'')          as fcha_fnal',
'      ,upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))  as nmbre_rprte',
'from df_c_imagenes_cliente a',
'join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_imgen_clnte = ''L_E''',
''))
,p_xml_structure=>'APEX'
,p_format=>'PDF'
,p_output_file_name=>'pq_g_rprte_rdcdo_ttl'
,p_content_disposition=>'ATTACHMENT'
,p_xml_items=>'F_CDGO_CLNTE'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(15557805466535208)
,p_shared_query_id=>wwv_flow_api.id(7230737569049381)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta Basica',
'select upper(b.nmbre_clnte)nmbre_clnte',
'       ,upper(b.slgan)slgan',
'       ,pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'       ,to_char(systimestamp, ''DD/MM/YYYY'') HOY',
'       ,:F_IP as ipaddr',
'       ,:F_NMBRE_USRIO as Usuario     ',
'       ,a.file_mimetype',
'      ,pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO'')          as fcha_incial',
'      ,pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_FIN'')          as fcha_fnal',
'      ,upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))  as nmbre_rprte',
'from df_c_imagenes_cliente a',
'join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'where a.cdgo_clnte = :F_CDGO_CLNTE',
'and a.cdgo_imgen_clnte = ''L_E''',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(15558037364535208)
,p_shared_query_id=>wwv_flow_api.id(7230737569049381)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.nmro_rdcdo_dsplay',
'      ,trunc(a.fcha_rdcdo)   as     fcha_rdcdo',
'      ,c.dscrpcion',
'      ,trunc(a.fcha_pryctda) as     fcha_pryctda    ',
'      ,f.nmbre_trcro                nmbre_trcro',
'      ,count(a.nmro_rdcdo_dsplay)   cndad',
'from pq_g_solicitudes                   a',
'join pq_g_solicitudes_motivo            b on a.id_slctud                = b.id_slctud',
'join pq_d_motivos                       c on b.id_mtvo                  = c.id_mtvo',
'join v_wf_g_instancias_flujo_gnrdo      d on a.id_instncia_fljo         = d.id_instncia_fljo',
'left join wf_g_instancias_transicion         e on d.id_instncia_fljo_gnrdo   = e.id_instncia_fljo',
'left join v_sg_g_usuarios                    f on e.id_usrio                 = f.id_usrio',
'where a.cdgo_clnte                 = :F_CDGO_CLNTE  ',
' and e.id_usrio                    = (select extractvalue(xmltype(:P2_XML),''//ID_USRIO'') from dual)  ',
' and b.id_mtvo                     = nvl((select extractvalue(xmltype(:P2_XML),''//P_ID_MTVO'') from dual),b.id_mtvo)',
' and (trunc(a.fcha_rdcdo)          >= (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'') from dual)or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'') from dual) is null) ',
' and (trunc(a.fcha_rdcdo)          <= (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_FIN'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_FIN'') from dual)is null)',
' and (trunc(a.fcha_pryctda)        >= (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_INCIO'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_INCIO'') from dual) is null)',
' and (trunc(a.fcha_pryctda)        <= (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_FIN'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_FIN'') from dual) is null) ',
'group by  a.nmro_rdcdo_dsplay, ',
'        a.fcha_rdcdo,',
'        c.dscrpcion,',
'        a.fcha_pryctda,',
'        f.nmbre_trcro',
'union',
'select a.nmro_rdcdo_dsplay',
'      ,trunc(a.fcha_rdcdo)   as     fcha_rdcdo',
'      ,c.dscrpcion',
'      ,trunc(a.fcha_pryctda) as     fcha_pryctda',
'      ,g.nmbre_trcro                nmbre_trcro',
'      ,count(a.nmro_rdcdo_dsplay)   cndad',
'from pq_g_solicitudes                   a',
'join pq_g_solicitudes_motivo            b on a.id_slctud                = b.id_slctud',
'join pq_d_motivos                       c on b.id_mtvo                  = c.id_mtvo',
'join v_sg_g_usuarios                    g on a.id_usrio                 = g.id_usrio',
'where a.cdgo_clnte                 = :F_CDGO_CLNTE  ',
' and a.id_usrio                    = (select extractvalue(xmltype(:P2_XML),''//ID_USRIO'') from dual)   ',
' and b.id_mtvo                     = nvl((select extractvalue(xmltype(:P2_XML),''//P_ID_MTVO'') from dual),b.id_mtvo)',
' and (trunc(a.fcha_rdcdo)          >= (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'') from dual)or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'') from dual) is null) ',
' and (trunc(a.fcha_rdcdo)          <= (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_FIN'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_FIN'') from dual)is null)',
' and (trunc(a.fcha_pryctda)        >= (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_INCIO'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_INCIO'') from dual) is null)',
' and (trunc(a.fcha_pryctda)        <= (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_FIN'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_FIN'') from dual) is null) ',
'group by  a.nmro_rdcdo_dsplay, ',
'        a.fcha_rdcdo,',
'        c.dscrpcion,',
'        a.fcha_pryctda,',
'        g.nmbre_trcro',
'order by 2,4 desc  '))
);
end;
/
