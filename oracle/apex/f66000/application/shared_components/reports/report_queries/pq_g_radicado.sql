prompt --application/shared_components/reports/report_queries/pq_g_radicado
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(82217002218713804)
,p_name=>'pq_g_radicado'
,p_query_text=>'select * from pq_g_solicitudes'
,p_format=>'PDF'
,p_output_file_name=>'pq_g_radicado'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22158555268224282)
,p_shared_query_id=>wwv_flow_api.id(82217002218713804)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''dd/mm/yyy'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,',
'         a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on (a.cdgo_clnte = b.cdgo_clnte) ',
'  where  a.cdgo_clnte = :F_CDGO_CLNTE ',
'    and a.cdgo_imgen_clnte = ''L_E''',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22158775147224282)
,p_shared_query_id=>wwv_flow_api.id(82217002218713804)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  s.id_slctud,',
'        r.id_slctnte,',
'        upper(r.cdgo_idntfccion_tpo || '':'' || r.idntfccion) idntfccion_slctnte,        ',
'        r.nmbre_slctnte,',
'        r.drccion_ntfccion,',
'        r.tlfno,',
'        r.dscrpcion_idntfccion_tpo,',
'        r.dscrpcion_rspnsble_tpo,',
'        s.nmro_rdcdo_dsplay,',
'        fcha_rdcdo,',
'        s.nmbre_impsto_sbmpsto,',
'        s.idntfccion,',
'        s.idntfccion_rdcdor,',
'        s.nmbre_rdcdor,',
'        s.dscrpcion_fljo_gnrdo,',
'        s.dscrpcion_tpo_prsntcion,',
'        s.dscrpcion_tpo,        ',
'        r.email,',
'        r.cllar',
' from v_pq_g_solicitudes  s',
' join v_pq_g_solicitantes r  on s.id_slctud = r.id_slctud',
'  where s.cdgo_clnte = :F_CDGO_CLNTE ',
'    and s.id_slctud  = (select extractvalue(xmltype(:P2_XML),''//id_slctud'') from dual);'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22158931442224282)
,p_shared_query_id=>wwv_flow_api.id(82217002218713804)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_slctud,',
'      a.indcdor_fcha_rspsta,',
'      case a.indcdor_fcha_rspsta when ''L'' then to_char (d.fcha_lmte_ley, ''dd/mm/yyyy'')',
'                                 when ''P'' then to_char (d.fcha_pryctda, ''dd/mm/yyyy'') end fcha_rpsta,',
'      a.actvo,',
'      a.obsrvcion,',
'      c.idntfccion_sjto,',
'      c.drccion drccion_sjto_impsto,',
'      a.id_mtvo,',
'      upper(e.dscrpcion) as mtvo,',
'      f.id_usrio,',
'      g.nmbre_trcro funcionario',
'from v_pq_g_solicitudes_motivo          a',
'left join pq_g_slctdes_mtvo_sjt_impst   b on a.id_slctud_mtvo           = b.id_slctud_mtvo',
'left join v_si_i_sujetos_impuesto       c on b.id_sjto_impsto           = c.id_sjto_impsto',
'join v_pq_g_solicitudes                 d on a.id_slctud                = d.id_slctud',
'join pq_d_motivos                       e on a.id_mtvo                  = e.id_mtvo',
'join wf_g_instancias_transicion         f on d.id_instncia_fljo_gnrdo   = f.id_instncia_fljo',
'join v_sg_g_usuarios                    g on f.id_usrio =  g.id_usrio',
'where a.cdgo_clnte = :F_CDGO_CLNTE   ',
'and a.id_slctud    = (select extractvalue(xmltype(:P2_XML),''//id_slctud'') from dual)',
'fetch first 1 rows only',
';    '))
);
end;
/
