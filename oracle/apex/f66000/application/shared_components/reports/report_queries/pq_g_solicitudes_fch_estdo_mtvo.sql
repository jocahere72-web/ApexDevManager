prompt --application/shared_components/reports/report_queries/pq_g_solicitudes_fch_estdo_mtvo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(16389384122369356)
,p_name=>'pq_g_solicitudes_fch_estdo_mtvo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select cdgo_clnte,',
'      nmro_rdcdo_dsplay,',
'      initcap(nmbre_rdcdor) nmbre_rdcdor,',
'      dscrpcion_mtvo dscrpcion,',
'      dscrpcion_estdo,',
'      idntfccion,',
'      nmbre_impsto,',
'      nmbre_impsto_sbmpsto,',
'      fcha_rdcdo,',
'      fcha_pryctda,',
'      fcha_real,',
'      id_instncia_fljo,',
'      dscrpcion_rspsta',
' from v_pq_g_solicitudes',
'where cdgo_clnte = :F_CDGO_CLNTE',
'  and id_mtvo = nvl(:P12_ID_MTVO, id_mtvo)',
'  and id_estdo = nvl(:P12_ESTDO, id_estdo)',
'  and nvl(cdgo_rspsta,0) = nvl(:P12_CDGO_RSPSTA, nvl(cdgo_rspsta,0))',
'  and nmro_rdcdo_dsplay = nvl(:P12_NMRO_RDCDO_DSPLAY, nmro_rdcdo_dsplay)',
'  and (TRUNC(fcha_rdcdo)   >= TRUNC(TO_DATE(:P12_FCHA_RDCDO_INCIO,''DD/MM/YYYY'')) OR :P12_FCHA_RDCDO_INCIO IS NULL)',
'  and (TRUNC(fcha_rdcdo)   <= TRUNC(TO_DATE(:P12_FCHA_RDCDO_FIN,''DD/MM/YYYY'')) OR :P12_FCHA_RDCDO_FIN IS NULL)',
'  and (TRUNC(fcha_pryctda) >= TRUNC(TO_DATE(:P12_FCHA_PRYCTDA_INCIO,''DD/MM/YYYY'')) OR :P12_FCHA_PRYCTDA_INCIO IS NULL)',
'  and (TRUNC(fcha_pryctda) <= TRUNC(TO_DATE(:P12_FCHA_PRYCTDA_FIN,''DD/MM/YYYY'')) OR :P12_FCHA_PRYCTDA_FIN IS NULL)',
'  and (TRUNC(fcha_real)    >= TRUNC(TO_DATE(:P12_FCHA_REAL_INCIO,''DD/MM/YYYY'')) OR :P12_FCHA_REAL_INCIO IS NULL)',
'  and (TRUNC(fcha_real)    <= TRUNC(TO_DATE(:P12_FCHA_REAL_FIN,''DD/MM/YYYY'')) OR :P12_FCHA_REAL_FIN IS NULL) '))
,p_format=>'PDF'
,p_output_file_name=>'pq_g_solicitudes_fch_estdo_mtvo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(17961377419186158)
,p_shared_query_id=>wwv_flow_api.id(16389384122369356)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'      and (id_mtvo                =  (select extractvalue(xmltype(:P2_XML),''//P_ID_MTVO'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_ID_MTVO'') from dual) is null)',
'       and (id_estdo               =  (select extractvalue(xmltype(:P2_XML),''//P_ID_ESTDO'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_ID_ESTDO'') from dual) is null) ',
'      and  (nmro_rdcdo_dsplay     =  (select extractvalue(xmltype(:P2_XML),''//P_NMRO_RDCDO_DSPLAY'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_NMRO_RDCDO_DSPLAY'') from dual) is null)',
'     and (trunc(fcha_rdcdo)     >=  (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'') from dual)  or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'') from dual)  is null) ',
'      and (trunc(fcha_rdcdo)     >=  (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'')from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'')from dual)is null)',
'      and (trunc(fcha_pryctda)   >=  (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_INCIO'')from dual)or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_INCIO'')from dual) is null)',
'      and (trunc(fcha_pryctda)   <=  (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_FIN'')from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_FIN'')from dual) is null)  ',
'      and (trunc(fcha_real )     >=  (select extractvalue(xmltype(:P2_XML),''//P_FCHA_REAL_INCIO'')from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_REAL_INCIO'')from dual) is null )',
'      and (trunc(fcha_real )     <=  (select extractvalue(xmltype(:P2_XML),''//P_FCHA_REAL_FIN'')from dual) or (select extractvalue(xmltype(:P2_XML),''//P_FCHA_REAL_FIN'')from dual) is null)',
'      and (cdgo_rspsta            =  (select extractvalue(xmltype(:P2_XML),''//P_CDGO_RSPSTA'')from dual) or (select extractvalue(xmltype(:P2_XML),''//P_CDGO_RSPSTA'')from dual) is null)',
'      order by dscrpcion_estdo',
'',
'',
'',
'            ',
'            ',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(17961596240186158)
,p_shared_query_id=>wwv_flow_api.id(16389384122369356)
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
 p_id=>wwv_flow_api.id(17961780300186158)
,p_shared_query_id=>wwv_flow_api.id(16389384122369356)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'    ',
'    select  id_slctud,',
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
'    and (id_mtvo            =   (select extractvalue(xmltype(:P2_XML),''//P_ID_MTVO'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_ID_MTVO'') from dual) is null)',
'    and (id_estdo           =   (select extractvalue(xmltype(:P2_XML),''//P_ID_ESTDO'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_ID_ESTDO'') from dual) is null) ',
'    and (cdgo_rspsta        =   (select extractvalue(xmltype(:P2_XML),''//P_CDGO_RSPSTA'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_CDGO_RSPSTA'') from dual) is null)',
'    and (nmro_rdcdo_dsplay  =  (select extractvalue(xmltype(:P2_XML),''//P_NMRO_RDCDO_DSPLAY'') from dual) or (select extractvalue(xmltype(:P2_XML),''//P_NMRO_RDCDO_DSPLAY'') from dual) is null)',
'    and  trunc(fcha_incio)     between  nvl((select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_INCIO'') from dual),trunc(fcha_incio)) and nvl((select extractvalue(xmltype(:P2_XML),''//P_FCHA_RDCDO_FIN'') from dual),trunc(fcha_incio))',
'    and  trunc(fcha_fin_Plnda) between  nvl((select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_INCIO'') from dual),trunc(fcha_fin_Plnda)) and nvl((select extractvalue(xmltype(:P2_XML),''//P_FCHA_PRYCTDA_FIN'') from dual),trunc(fcha_fin_Plnda))',
'    and  trunc(fcha_fin_Real ) between  nvl((select extractvalue(xmltype(:P2_XML),''//P_FCHA_REAL_INCIO'') from dual),trunc(fcha_fin_Real)) and nvl((select extractvalue(xmltype(:P2_XML),''//P_FCHA_REAL_FIN'') from dual),trunc(fcha_fin_Real)) '))
);
end;
/
