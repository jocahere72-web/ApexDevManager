prompt --application/shared_components/reports/report_queries/pq_g_solicitudes_x_fncnrios
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(17468559643345169)
,p_name=>'pq_g_solicitudes_x_fncnrios'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select        cdgo_clnte,',
'			  id_mtvo,',
'              id_estdo,',
'			  nmro_rdcdo_dsplay,',
'			  initcap(nmbre_rdcdor) nmbre_rdcdor,',
'			  dscrpcion_estdo,',
'			  idntfccion,',
'			  nmbre_impsto,',
'			  nmbre_impsto_sbmpsto,',
'			  trunc(fcha_rdcdo) fcha_rdcdo,',
'			  trunc(fcha_pryctda) fcha_pryctda,',
'			  trunc (fcha_real) fcha_real,',
'			  id_instncia_fljo,',
'			  dscrpcion_rspsta,              ',
'              dscrpcion_mtvo,',
'              initcap(dscrpcion_Tpo_Prsntcion) dscrpcion_Tpo_Prsntcion,',
'              etapa,',
'              pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO'') FCHA_RDCDO_INCIO,',
'              pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_FIN'') FCHA_RDCDO_FIN,',
'              pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_INCIO'' ) FCHA_PRYCTDA_INCIO,',
'              pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_FIN'' ) FCHA_PRYCTDA_FIN,',
'              pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_INCIO'' ) FCHA_REAL_INCIO,',
'              pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_FIN'') FCHA_REAL_FIN                        ',
'              ',
'from       v_pq_g_solicitudes',
'   ',
'where      cdgo_clnte             =  :F_CDGO_CLNTE                          ',
'      and  id_usrio               =  nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''ID_USRIO''), :F_ID_USRIO)  ',
'      and (id_mtvo                =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_MTVO'' ) or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_MTVO'' ) is null)',
'      and (id_estdo               =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_ESTDO'' ) or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_ESTDO'' ) is null) ',
'      and  (nmro_rdcdo_dsplay      =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_NMRO_RDCDO_DSPLAY'' ) or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_NMRO_RDCDO_DSPLAY'' ) is null)',
'      and (trunc(fcha_rdcdo)     >=  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO'') or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO'') is null) ',
'      and (trunc(fcha_rdcdo)     >=  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO'') or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO'')is null)',
'      and (trunc(fcha_pryctda)   >=  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_INCIO'' ) or  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_INCIO'' ) is null)',
'      and (trunc(fcha_pryctda)   <=  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_FIN'' ) or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_FIN'' ) is null)  ',
'      and (trunc(fcha_real )     >=  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_INCIO'' ) or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_INCIO'' ) is null )',
'      and (trunc(fcha_real )     <=  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_FIN'') or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_FIN'') is null)',
'      and (cdgo_rspsta            =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_CDGO_RSPSTA'') or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_CDGO_RSPSTA'') is null)',
'      order by dscrpcion_estdo',
'',
'         ',
'           ',
'             ',
'            ',
'            ',
'            ',
'            ',
''))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_solicitudes_x_fncnrios'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(19042256048881390)
,p_shared_query_id=>wwv_flow_api.id(17468559643345169)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'         pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'          to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'         :F_IP as ipaddr,',
'         :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        (select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = :P_ID_IMPSTO)nmbre_impsto,',
'        (select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = :P_ID_RPRTE)nmbre_rpte',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E''',
'    '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(19042457165881390)
,p_shared_query_id=>wwv_flow_api.id(17468559643345169)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  id_slctud,',
'        initcap(nmbre_trcro) nmbre_trcro,',
'        nmro_rdcdo_dsplay,',
'        etapa,',
'        --trunc(fcha_incio) f_incio_instncia,',
'        --trunc(fcha_fin_Plnda) f_fn_plnda,',
'        --trunc(fcha_fin_Real) f_fn_real, ',
'        initcap(estdo_instncia) estdo_instncia,',
'        --trunc(fcha_fin_plnda)-trunc(Fcha_Incio) diasprog,',
'        --trunc(nvl(fcha_fin_real,Sysdate))-trunc(Fcha_Incio) diasreal,',
'        --(trunc(fcha_fin_plnda)-trunc(fcha_incio))-(trunc(nvl(fcha_fin_real,Sysdate))-trunc(fcha_incio)) gstion_nstncia,',
'        trunc(fcha_rdcdo) fcha_rdcdo,',
'        trunc(fcha_pryctda) fcha_pryctda,',
'		trunc (fcha_real) fcha_real,',
'        trunc(fcha_pryctda)-trunc(fcha_rdcdo) diasprog,',
'        trunc(nvl(fcha_real,sysdate))-trunc(fcha_rdcdo) diasreal,',
'        (trunc(fcha_pryctda)-trunc(fcha_rdcdo))  -  (trunc(nvl(fcha_real,sysdate))-trunc(fcha_rdcdo)) gstion_nstncia,',
'        pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO'') FCHA_RDCDO_INCIO,',
'        pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_FIN'') FCHA_RDCDO_FIN,',
'        pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_INCIO'' ) FCHA_PRYCTDA_INCIO,',
'        pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_FIN'' ) FCHA_PRYCTDA_FIN,',
'        pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_INCIO'' ) FCHA_REAL_INCIO,',
'        pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_FIN'' ) FCHA_REAL_FIN',
'            ',
'from    v_pq_g_solicitudes',
'',
'where   cdgo_clnte          =   :F_CDGO_CLNTE                          ',
'    and  id_usrio           =   nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''ID_USRIO''), :F_ID_USRIO)',
'    and (id_mtvo            =   pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_MTVO'' ) or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_MTVO'' ) is null)',
'    and (id_estdo           =   pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_ESTDO'' ) or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_ESTDO'' ) is null) ',
'    and (cdgo_rspsta        =   pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_CDGO_RSPSTA'') or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_CDGO_RSPSTA'') is null)',
'    and (nmro_rdcdo_dsplay  =  pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_NMRO_RDCDO_DSPLAY'' ) or pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_NMRO_RDCDO_DSPLAY'' ) is null)',
'    and  trunc(fcha_incio)     between  nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO_INCIO''),trunc(fcha_incio)) and nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RDCDO'
||'_FIN''),trunc(fcha_incio))',
'    and  trunc(fcha_fin_Plnda) between  nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_PRYCTDA_INCIO'' ),trunc(fcha_fin_Plnda)) and nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCH'
||'A_PRYCTDA_FIN'' ),trunc(fcha_fin_Plnda))',
'    and  trunc(fcha_fin_Real ) between  nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_REAL_INCIO'' ),trunc(fcha_fin_Real)) and nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_FCHA_RE'
||'AL_FIN'' ),trunc(fcha_fin_Real))',
'    '))
);
end;
/
