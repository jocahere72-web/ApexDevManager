prompt --application/shared_components/reports/report_queries/cb_g_cmprtvo_prcsos_cbro
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(46039268838807577)
,p_name=>'cb_g_cmprtvo_prcsos_cbro'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_prcsos_jrdco,',
'       d.id_prcsos_jrdco_dcmnto,',
'       d.id_instncia_fljo,',
'       d.id_etpa,',
'       d.nmro_prcso_jrdco,',
'       d.nombre_etpa,',
'       b.idntfccion,',
'       b.nmbre_cmplto,',
'       trim(b.drccion_ntfccion) as direccion,',
'       nvl(b.tlfno,0) as telefono,',
'       d.id_acto,',
'       d.dscrpcion_acto_tpo,',
'       d.nmro_acto,',
'       trunc(d.fcha_acto) fcha_acto,',
'       d.cdgo_prcsos_jrdco_estdo,',
'       pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(d.id_prcsos_jrdco) as mnto_rcdo,',
'       max(a.vgncia) as vigencia_maxima,',
'       min(a.vgncia) as vigencia_minima       ',
'from v_cb_g_procesos_jrdco_dcmnto d',
'join cb_g_procesos_jrdco_mvmnto a on d.id_prcsos_jrdco = a.id_prcsos_jrdco',
'left join v_cb_g_procesos_jrdco_rspnsble b on d.id_prcsos_jrdco = b.id_prcsos_jrdco',
'                                        and b.actvo = ''A''',
'                                        and b.prncpal_s_n = ''S''',
'where b.cdgo_clnte = 6  ',
'  and d.actvo = ''S''',
'  --and d.fcha_acto between ''02/09/2019'' and ''30/09/2019''',
'',
'group by d.id_prcsos_jrdco,',
'       d.id_prcsos_jrdco_dcmnto,',
'       d.id_instncia_fljo,',
'       d.id_etpa,',
'       d.nmro_prcso_jrdco,',
'       d.nombre_etpa,',
'       b.idntfccion,',
'       b.nmbre_cmplto,',
'       b.drccion_ntfccion,',
'       b.tlfno,',
'       d.id_acto,',
'       d.dscrpcion_acto_tpo,',
'       d.nmro_acto,',
'       d.fcha_acto,',
'       d.cdgo_prcsos_jrdco_estdo;'))
,p_report_layout_id=>wwv_flow_api.id(46326432296608401)
,p_format=>'PDF'
,p_output_file_name=>'cb_g_cmprtvo_prcsos_cbro'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21844596681875030)
,p_shared_query_id=>wwv_flow_api.id(46039268838807577)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select d.id_prcsos_jrdco,',
'      d.id_prcsos_jrdco_dcmnto,',
'      d.id_instncia_fljo,',
'      d.id_etpa,',
'      d.nmro_prcso_jrdco,',
'      d.nombre_etpa,',
'      b.idntfccion,',
'      b.nmbre_cmplto,',
'      trim(b.drccion_ntfccion) as direccion,',
'      nvl(b.tlfno,0) as telefono,',
'      d.id_acto,',
'      d.dscrpcion_acto_tpo,',
'      d.nmro_acto,',
'      trunc(d.fcha_acto) fcha_acto,',
'      d.cdgo_prcsos_jrdco_estdo,',
'      upper(json_value(:P37_JSON , ''$.nmbre_rprte'')) as nmbre_rprte,',
'      pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(d.id_prcsos_jrdco,json_value(:P37_JSON , ''$.fcha_dsde''),json_value(:P37_JSON , ''$.fcha_fnal''),json_value(:P37_JSON , ''$.id_impsto''), json_value(:P37_JSON,''$.cdgo_clnte'')) as mnto_rcdo,',
'      max(a.vgncia) as vigencia_maxima,',
'      min(a.vgncia) as vigencia_minima',
'from v_cb_g_procesos_jrdco_dcmnto d',
'join cb_g_procesos_jrdco_mvmnto a on d.id_prcsos_jrdco = a.id_prcsos_jrdco',
'left join v_cb_g_procesos_jrdco_rspnsble b on d.id_prcsos_jrdco = b.id_prcsos_jrdco',
'                                       and b.actvo = ''A''',
'                                       and b.prncpal_s_n = ''S''',
'join si_i_sujetos_impuesto e on a.id_sjto_impsto = e.id_sjto_impsto                                        ',
'where d.cdgo_clnte = json_value(:P37_JSON,''$.cdgo_clnte'')',
'  and e.id_impsto  = json_value(:P37_JSON,''$.id_impsto'')',
'  and d.actvo = ''S''',
'having pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(d.id_prcsos_jrdco,json_value(:P37_JSON , ''$.fcha_dsde''),json_value(:P37_JSON , ''$.fcha_fnal''),json_value(:P37_JSON , ''$.id_impsto''), json_value(:P37_JSON,''$.cdgo_clnte'')) > 0',
'group by d.id_prcsos_jrdco,',
'      d.id_prcsos_jrdco_dcmnto,',
'      d.id_instncia_fljo,',
'      d.id_etpa,',
'      d.nmro_prcso_jrdco,',
'      d.nombre_etpa,',
'      b.idntfccion,',
'      b.nmbre_cmplto,',
'      b.drccion_ntfccion,',
'      b.tlfno,',
'      d.id_acto,',
'      d.dscrpcion_acto_tpo,',
'      d.nmro_acto,',
'      d.fcha_acto,',
'      d.cdgo_prcsos_jrdco_estdo;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21844703632875030)
,p_shared_query_id=>wwv_flow_api.id(46039268838807577)
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
 p_id=>wwv_flow_api.id(21844909811875030)
,p_shared_query_id=>wwv_flow_api.id(46039268838807577)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Procesos abiertos total y cantidad recaudado--',
'select count(b.id_prcsos_jrdco) as cant_a,nvl(sum(b.mnto_rcdo),0) as mnto_rcdo_a',
'from (',
' select a.id_prcsos_jrdco,',
'        pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(a.id_prcsos_jrdco,json_value(:P37_JSON , ''$.fcha_dsde''),json_value(:P37_JSON , ''$.fcha_fnal''),json_value(:P37_JSON , ''$.id_impsto''), json_value(:P37_JSON,''$.cdgo_clnte'')) as mnto_rcdo',
'   from cb_g_procesos_juridico a',
'  where a.cdgo_prcsos_jrdco_estdo = ''A'') b',
'  where b.mnto_rcdo > 0;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21845115626875030)
,p_shared_query_id=>wwv_flow_api.id(46039268838807577)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --Procesos Cerrados total y cantidad recaudado--',
'select count(b.id_prcsos_jrdco) cant_c ,nvl(sum(b.mnto_rcdo),0) as mnto_rcdo_c',
'from (',
' select a.id_prcsos_jrdco,',
'        pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(a.id_prcsos_jrdco,json_value(:P37_JSON , ''$.fcha_dsde''),json_value(:P37_JSON , ''$.fcha_fnal''),json_value(:P37_JSON , ''$.id_impsto''), json_value(:P37_JSON,''$.cdgo_clnte'')) as mnto_rcdo',
'   from cb_g_procesos_juridico a',
'  where a.cdgo_prcsos_jrdco_estdo = ''C'') b',
'  where b.mnto_rcdo > 0;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21845336205875030)
,p_shared_query_id=>wwv_flow_api.id(46039268838807577)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Procesos con Recaudos cantidad y total recaudado--',
'select count(b.id_prcsos_jrdco) cant_t ,nvl(sum(b.mnto_rcdo),0) as mnto_rcdo_t',
'from (',
' select a.id_prcsos_jrdco,',
'        pkg_cb_proceso_juridico.fnc_mt_mnto_rcdo_prcso_jrdco(a.id_prcsos_jrdco,json_value(:P37_JSON , ''$.fcha_dsde''),json_value(:P37_JSON , ''$.fcha_fnal''),json_value(:P37_JSON , ''$.id_impsto''), json_value(:P37_JSON,''$.cdgo_clnte'')) as mnto_rcdo',
'   from cb_g_procesos_juridico a',
'  where a.cdgo_prcsos_jrdco_estdo IN (''A'',''C'')) b',
'where b.mnto_rcdo > 0;'))
);
end;
/
