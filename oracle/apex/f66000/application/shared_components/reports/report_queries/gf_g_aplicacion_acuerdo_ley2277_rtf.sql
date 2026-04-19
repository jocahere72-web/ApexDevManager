prompt --application/shared_components/reports/report_queries/gf_g_aplicacion_acuerdo_ley2277_rtf
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(22359725921844364)
,p_name=>'gf_g_aplicacion_acuerdo_ley2277_rtf'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Datos generales acto apli',
'SELECT initcap(a.nmbre_impsto_sbmpsto) nmbre_impsto,',
'       a.nmro_cnvnio,',
'       e.prmer_nmbre sujeto_pasivo,',
'       initcap(to_char(a.fcha_acto,',
'                       ''FMMONTH DD "de" YYYY '',',
'                       ''nls_date_language=spanish'')) fcha_acto,',
'       to_char(a.fcha_acto, ''YYYY'') anio,',
'       decode(c.cdgo_sjto_tpo,',
'              ''E'',',
'              ''NOMBRE / RAZON SOCIAL'',',
'              ''P'',',
'              ''REFERENCIA CATASTRAL'',',
'              ''V'',',
unistr('              ''N\00DAMERO DE PLACA'','),
'              ''SUJETO PASIVO'') ttlo1,',
'       decode(c.cdgo_sjto_tpo,',
'              ''E'',',
'              ''CC / NIT'',',
'              ''P'',',
unistr('              ''MATR\00CDCULA INMOBILIARIA'','),
'              null) ttlo2,',
'       decode(c.cdgo_sjto_tpo, ''E'', m.nmbre_rzon_scial, a.idntfccion_sjto) rzon_scial_rfrncia,',
'       decode(c.cdgo_sjto_tpo,',
'              ''E'',',
'              a.idntfccion_sjto,',
'              ''P'',',
'              n.mtrcla_inmblria,',
'              null) nit_matricula,',
'       a.drccion,',
'       upper(a.nmbre_slctnte) nmbre_slctnte,',
'       a.nmro_idntfccion_slctnte,',
'       upper(a.dscrpcion_rspnsble_tpo) tpo_slcntnte,',
'       upper(a.drccion_ntfccion) drccion_ntfccion,',
'       a.email,',
'       decode(a.tlfno,',
'              null,',
'              decode(a.cllar, null, null, a.cllar),',
'              decode(a.cllar, null, a.tlfno, a.tlfno || '' / '' || a.cllar)) tlfnos,',
'       initcap(to_char(a.fcha_rdcdo,',
'                       ''FMMONTH DD "de" YYYY '',',
'                       ''nls_date_language=spanish'')) fcha_rdcdo,',
'       a.nmro_rdcdo_dsplay,',
'       a.nmro_cta nmro_ctas,',
'       c.cdgo_sjto_tpo,',
'       a.cdgo_rspnsble_tpo,',
'       o.prmer_nmbre || '' '' || o.sgndo_nmbre || '' '' || o.prmer_aplldo || '' '' ||',
'       o.sgndo_aplldo nmbre_rzon_scial_gstor,',
'       o.idntfccion idntfccion_gstor,',
'       (select p.nmtcnco_idntfccion_tpo',
'          from df_s_identificaciones_tipo p',
'         where p.cdgo_idntfccion_tpo = o.cdgo_idntfccion_tpo) cdgo_idntfccion_tpo,',
'         decode(c.cdgo_sjto_tpo,',
'              ''P'',',
'              ''inmbueble'',',
'              ''V'',',
'               ''vehiculo'',',
'              ''contribuyente'') crctrstca_sujeto,',
'       a.OBSRVCION',
'  FROM v_gf_g_convenios a',
'  JOIN df_s_clientes b',
'    ON a.cdgo_clnte = b.cdgo_clnte',
'  JOIN v_gf_d_convenios_tipo c',
'    ON a.id_cnvnio_tpo = c.id_cnvnio_tpo',
'  LEFT JOIN df_c_decretos d',
'    ON c.id_dcrto = d.id_dcrto',
'  JOIN si_i_sujetos_responsable e',
'    ON e.id_sjto_impsto = a.id_sjto_impsto',
'   and e.prncpal_s_n = ''S''',
'  LEFT JOIN v_re_g_recaudos g',
'    ON a.id_dcmnto_cta_incial = g.id_orgen',
'  LEFT JOIN v_re_g_recaudos_control h',
'    ON g.id_rcdo_cntrol = h.id_rcdo_cntrol',
'  JOIN gf_d_convenios_tipo i',
'    ON a.id_cnvnio_tpo = i.id_cnvnio_tpo',
'  left join si_i_personas m',
'    on m.id_sjto_impsto = a.id_sjto_impsto',
'  left join si_i_predios n',
'    on n.id_sjto_impsto = a.id_sjto_impsto',
'  join pq_g_radicador o',
'    on o.id_rdcdor = a.id_rdcdor',
' WHERE a.cdgo_clnte = :F_CDGO_CLNTE',
'   AND a.id_cnvnio = :p2_prmtro_1'))
,p_format=>'PDF'
,p_output_file_name=>'gf_g_aplicacion_acuerdo_ley2277_rtf'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27528440687657582)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. Datos generales acto apli',
'SELECT initcap(a.nmbre_impsto_sbmpsto) nmbre_impsto,',
'       a.nmro_cnvnio,',
'       e.prmer_nmbre sujeto_pasivo,',
'       initcap(to_char(a.fcha_acto,',
'                       ''FMMONTH DD "de" YYYY '',',
'                       ''nls_date_language=spanish'')) fcha_acto,',
'       to_char(a.fcha_acto, ''YYYY'') anio,',
'       decode(c.cdgo_sjto_tpo,',
'              ''E'',',
'              ''NOMBRE / RAZON SOCIAL'',',
'              ''P'',',
'              ''REFERENCIA CATASTRAL'',',
'              ''V'',',
unistr('              ''N\00DAMERO DE PLACA'','),
'              ''SUJETO PASIVO'') ttlo1,',
'       decode(c.cdgo_sjto_tpo,',
'              ''E'',',
'              ''CC / NIT'',',
'              ''P'',',
unistr('              ''MATR\00CDCULA INMOBILIARIA'','),
'              null) ttlo2,',
'       decode(c.cdgo_sjto_tpo, ''E'', m.nmbre_rzon_scial, a.idntfccion_sjto) rzon_scial_rfrncia,',
'       decode(c.cdgo_sjto_tpo,',
'              ''E'',',
'              a.idntfccion_sjto,',
'              ''P'',',
'              n.mtrcla_inmblria,',
'              null) nit_matricula,',
'       a.drccion,',
'       upper(a.nmbre_slctnte) nmbre_slctnte,',
'       a.nmro_idntfccion_slctnte,',
'       upper(a.dscrpcion_rspnsble_tpo) tpo_slcntnte,',
'       upper(a.drccion_ntfccion) drccion_ntfccion,',
'       a.email,',
'       decode(a.tlfno,',
'              null,',
'              decode(a.cllar, null, null, a.cllar),',
'              decode(a.cllar, null, a.tlfno, a.tlfno || '' / '' || a.cllar)) tlfnos,',
'       initcap(to_char(a.fcha_rdcdo,',
'                       ''FMMONTH DD "de" YYYY '',',
'                       ''nls_date_language=spanish'')) fcha_rdcdo,',
'       a.nmro_rdcdo_dsplay,',
'       a.nmro_cta nmro_ctas,',
'       c.cdgo_sjto_tpo,',
'       a.cdgo_rspnsble_tpo,',
'       o.prmer_nmbre || '' '' || o.sgndo_nmbre || '' '' || o.prmer_aplldo || '' '' ||',
'       o.sgndo_aplldo nmbre_rzon_scial_gstor,',
'       o.idntfccion idntfccion_gstor,',
'       (select p.nmtcnco_idntfccion_tpo',
'          from df_s_identificaciones_tipo p',
'         where p.cdgo_idntfccion_tpo = o.cdgo_idntfccion_tpo) cdgo_idntfccion_tpo,',
'         decode(c.cdgo_sjto_tpo,',
'              ''P'',',
'              ''inmbueble'',',
'              ''V'',',
'               ''vehiculo'',',
'              ''contribuyente'') crctrstca_sujeto,',
'       a.OBSRVCION',
'        FROM v_gf_g_convenios a',
'  JOIN df_s_clientes b',
'    ON a.cdgo_clnte = b.cdgo_clnte',
'  JOIN v_gf_d_convenios_tipo c',
'    ON a.id_cnvnio_tpo = c.id_cnvnio_tpo',
'  LEFT JOIN df_c_decretos d',
'    ON c.id_dcrto = d.id_dcrto',
'  JOIN si_i_sujetos_responsable e',
'    ON e.id_sjto_impsto = a.id_sjto_impsto',
'   and e.prncpal_s_n = ''S''',
'  LEFT JOIN v_re_g_recaudos g',
'    ON a.id_dcmnto_cta_incial = g.id_orgen',
'  LEFT JOIN v_re_g_recaudos_control h',
'    ON g.id_rcdo_cntrol = h.id_rcdo_cntrol',
'  JOIN gf_d_convenios_tipo i',
'    ON a.id_cnvnio_tpo = i.id_cnvnio_tpo',
'  left join si_i_personas m',
'    on m.id_sjto_impsto = a.id_sjto_impsto',
'  left join si_i_predios n',
'    on n.id_sjto_impsto = a.id_sjto_impsto',
'  join pq_g_radicador o',
'    on o.id_rdcdor = a.id_rdcdor',
' WHERE a.cdgo_clnte = :F_CDGO_CLNTE',
'   AND a.id_cnvnio = :p2_prmtro_1;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27528684635657582)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Vigencias Acuerdos de Pag',
'	select listagg(vgncia, '', '') within group (order by vgncia) vgncia',
'	   from (',
'			   SELECT vgncia',
'				 FROM v_gf_g_convenios_cartera a',
'				 join v_gf_g_convenios         b   on   a.id_cnvnio=b.id_cnvnio',
'				where b.cdgo_clnte = :F_CDGO_CLNTE',
'				  and b.id_cnvnio  = :P2_PRMTRO_1',
'				 group by vgncia',
'			 )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27528819922657583)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3. Garantias Acuerdo Pago',
'select initcap(listagg(b.dscrpcion, '', '') within group (order by b.dscrpcion)) dscrpcion',
'  from gf_g_convenios a',
'  join gf_g_convenios_garantia b',
'    on a.id_cnvnio = b.id_cnvnio',
' where a.cdgo_clnte = :F_CDGO_CLNTE',
'   and a.id_cnvnio  = :P2_PRMTRO_1 '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27529040074657583)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--4. Cuota Inicial',
'select pkg_gf_convenios.fnc_co_cuota_in(p_id_cnvnio => :P2_PRMTRO_1) as cuota_inicial',
'   from dual   '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27529287472657583)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--5. Plan de Pago',
'select nmro_cta,',
'         to_char(a.vlor_cptal,''FM$999G999G999G999G999G999G990'') as vlor_cptal,',
'         to_char(a.vlor_intres,''FM$999G999G999G999G999G999G990'') as vlor_intres,',
'         to_char(a.vlor_fncncion,''FM$999G999G999G999G999G999G990'') as vlor_fncncion,',
'         to_char(vlor_ttal,''FM$999G999G999G999G999G999G990'') as vlor_ttal,',
'         to_char(fcha_vncmnto,''dd/mm/yyyy'') fcha_vncmnto',
'    from v_gf_g_convenios_extracto a',
'   where cdgo_clnte = :F_CDGO_CLNTE',
'     and id_cnvnio  = :P2_PRMTRO_1',
'     and actvo = ''S''',
'   order by nmro_cta'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27529440494657583)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--6. Encabezado ',
'select upper(b.nmbre_clnte)nmbre_clnte,',
'       upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY HH:MI AM'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        b.nmro_idntfccion nmro_idntfccion,',
'        b.nmbre_dprtmnto',
'   from df_c_imagenes_cliente a',
'   join v_df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27529699367657583)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--7. Carteras Convenidas',
'select initcap(a.dscrpcion) dscrpcion,',
'       a.vgncia ||''-''||a.prdo prdo,',
'       to_char(a.vlor_cptal,''FM$999G999G999G999G999G999G990'')  as vlor_cptal,',
'       to_char(a.vlor_intres,''FM$999G999G999G999G999G999G990'') as vlor_intres,',
'       to_char(a.vlor_ttal,''FM$999G999G999G999G999G999G990'')   as vlor_ttal',
'  from v_gf_g_convenios_cartera a',
' where id_cnvnio =  :P2_PRMTRO_1',
' and a.vlor_cptal > 0'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27529830010657583)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--8. Documentos Cuota Inicial',
' select a.id_cnvnio,',
'        a.id_dcmnto,',
'        b.nmro_dcmnto,',
'        to_char(b.vlor_ttal_dcmnto,''FM$999G999G999G999G999G999G990'') as vlor_ttal_dcmnto,',
'        initcap(pkg_gn_generalidades.fnc_number_to_text(trunc(nvl(b.vlor_ttal_dcmnto,0)), ''d'')) vlor_cta_ini_ltras,',
'        initcap(d.nmbre_bnco) nmbre_bnco_mdio_pgo,',
'        initcap(to_char(c.fcha_rcdo, ''FMMONTH DD "de" YYYY '')) fcha_rcdo',
'   from gf_g_cnvnios_cta_incl_vgnc      a',
'   join re_g_documentos                 b on a.id_dcmnto        = b.id_dcmnto',
'   left join v_re_g_recaudos            c on a.id_dcmnto        = c.id_orgen',
'   left join v_re_g_recaudos_control    d on d.id_rcdo_cntrol   = c.id_rcdo_cntrol',
'  where a.id_cnvnio = :P2_PRMTRO_1',
''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(27530086685657583)
,p_shared_query_id=>wwv_flow_api.id(22359725921844364)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--9. Obtener el funcionario Firma del Acto',
'select c.nmbre_trcro, d.nmbre_ofcna, e.nmbre_crgo',
'  from gn_d_actos_funcionario_frma a',
'  join gn_d_actos_tipo b on a.id_acto_tpo = b.id_acto_tpo',
'  join v_df_c_funcionarios c on a.id_fncnrio = c.id_fncnrio',
'  join df_c_oficinas d on c.id_ofcna = d.id_ofcna',
'  join df_c_cargos e on c.id_crgo = e.id_crgo',
' where b.cdgo_clnte = :F_CDGO_CLNTE',
'   and b.cdgo_acto_tpo = ''AAA''  '))
);
end;
/
