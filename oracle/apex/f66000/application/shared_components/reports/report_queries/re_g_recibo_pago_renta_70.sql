prompt --application/shared_components/reports/report_queries/re_g_recibo_pago_renta_70
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(79652923146643828)
,p_name=>'re_g_recibo_pago_renta_70'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.fcha_rgstro',
'        , a.nmbre_impsto_sbmpsto',
'        , b.nmbre_impsto_acto',
'        , c.nmbre_rzon_scial',
'        , a.idntfccion_sjto',
'        , to_char(a.vlor_bse_grvble, :F_FRMTO_MNDA)',
'        , a.nmbre_entdad',
'        , a.idntfccion_entdad',
'        , a.dscrpcion_ascda',
'        , a.txto_ascda',
'        , a.fcha_expdcion',
'        , trunc(a.fcha_vncmnto) fcha_vncmnto',
'    from v_gi_g_rentas          a',
'    join v_gi_g_rentas_acto     b on a.id_rnta          = b.id_rnta',
'    join v_si_i_personas        c on a.id_sjto_impsto   = c.id_sjto_impsto',
'    where a.id_rnta             = :P2_PRMTRO1'))
,p_format=>'PDF'
,p_output_file_name=>'re_g_recibo_pago_renta_70'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121227589909139552)
,p_shared_query_id=>wwv_flow_api.id(79652923146643828)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  --1. Encabezado Recibo de Pago Rentas',
'   select   a.cdgo_clnte',
'       ,    upper(a.nmbre_clnte) nmbre_clnte',
'       ,    upper(a.slgan) slgan',
'       ,    a.nmbre_ofcna',
'       ,    pkg_gn_generalidades.fnc_co_bancos_recaudadores (p_cdgo_clnte => a.cdgo_clnte, p_id_impsto => b.id_impsto, p_id_impsto_sbmpsto	=> b.id_impsto_sbmpsto) bncos_rcddres',
'       --,    e.nmbre_rzon_scial ',
'       ,    to_char (b.fcha_dcmnto, ''DD/MM/YYYY - HH12:MI:SS AM'') fcha_dcmnto',
'       ,    trunc (b.fcha_vncmnto) fcha_vncmnto',
'       ,    b.nmro_dcmnto',
'       ,    d.idntfccion_sjto',
'       ,    d.idntfccion_sjto_frmtda idntfccion',
'       ,    d.idntfccion_antrior_frmtda idntfccion_antrior',
'       ,    g.nmbre_impsto_sbmpsto       ',
'       ,    m.txto_ascda',
'       ,    m.fcha_expdcion',
'       ,    n.dscrpcion',
'       ,    nvl((:F_NMBRE_USRIO),''PORTAL WEB'')nmbre_usrio',
'       ,    a.nmbre_mncpio',
'       /*,    e.cdgo_idntfccion_tpo',
'       ,    e.idntfccion_rspnsble*/',
'       ,    g.cdgo_ean',
'       ,    pkgbarcode.funcadfac(null,null, null, b.nmro_dcmnto, b.vlor_ttal_dcmnto, b.fcha_vncmnto, g.cdgo_ean, ''S'') txto_cdgo_brra',
'       ,    pkgbarcode.fungencod(''EANUCC128'',pkgbarcode.funcadfac(null,null, null, b.nmro_dcmnto, b.vlor_ttal_dcmnto, b.fcha_vncmnto, g.cdgo_ean, ''N'' ) )cdgo_brra',
'       ,    l.nmbre_bnco_mdio_pgo nmbre_bnco',
'       ,    pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => i.file_blob ) as lgo_slgan',
'       ,    d.drccion',
'       ,    d.drccion_ntfccion',
'       ,    d.tlfno',
'       ,    d.cdgo_pstal',
'       ,    m.nmro_rnta',
'       ,    (select a.txto_bse_grvble ',
'               from df_i_impuestos_acto a ',
'               join gi_g_rentas_acto b on a.id_impsto_acto = b.id_impsto_acto',
'              where b.id_rnta = m.id_rnta',
'                and rownum = 1) txto_bse',
'       ,   to_char(vlor_bse_grvble, ''FM999G999G999G999G999G999G990'') vlor_bse_grvble',
'       ,   o.nmbre_rzon_scial cntrbynte',
'       ,   decode (m.indcdor_rnta_pgda, ''S'', ''PAGADO'', decode (b.indcdor_pgo_aplcdo, ''S'', ''Pagado'', null))indcdor_rnta_pgda',
'       , m.NMBRE_SCRSAL',
'       , (select g.drccion from si_i_sujetos_sucursal g where g.id_sjto_scrsal = m.id_sjto_scrsal) DRCCION_SCRSAL',
'     from  v_df_s_clientes a',
'     join  v_re_g_documentos b on b.id_dcmnto = :P2_PRMTRO_2',
'     --join  table (pkg_gn_generalidades.fnc_ca_split_table(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_DCMNTO'' )  ,''!'')) c on b.id_dcmnto = c.cdna   ',
'     join  v_si_i_sujetos_impuesto d on b.id_sjto_impsto = d.id_sjto_impsto',
'     /*join  v_si_i_sujetos_responsable e on b.id_sjto_impsto = e.id_sjto_impsto',
'                                    and e.prncpal_s_n = ''S''*/',
'     join  df_i_impuestos_subimpuesto g on b.id_impsto_sbmpsto = g.id_impsto_sbmpsto',
'     join  df_c_imagenes_cliente i on i.cdgo_clnte = a.cdgo_clnte ',
'                                  and i.cdgo_imgen_clnte = ''L_E''                           ',
'left join  table ( pkg_re_documentos.fnc_co_ultmo_rcdo (b.id_sjto_impsto)) l on b.id_sjto_impsto = b.id_sjto_impsto  ',
'left join  v_gi_g_rentas m on b.id_dcmnto = m.id_dcmnto',
'left join  gi_d_subimpuestos_asociada n on m.id_sbmpsto_ascda = n.id_sbmpsto_ascda ',
'     join  si_i_personas  o on o.id_sjto_impsto = d.id_sjto_impsto',
'    where  a.cdgo_clnte = :F_CDGO_CLNTE',
' order by  b.nmro_dcmnto;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121227752585139552)
,p_shared_query_id=>wwv_flow_api.id(79652923146643828)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Detalle Recibo de Pago Rentas',
'select  a.id_cncpto',
'     ,  to_char(nvl(a.vlor_dbe,0), :F_FRMTO_MNDA) vlor_lqddo',
'     ,  b.dscrpcion_cncpto',
'     ,  b.txto_trfa',
'     ,  b.cdgo_cncpto',
'     ,  b.nmbre_impsto_acto',
'  from  v_re_g_documentos_detalle a',
'  join  v_gi_g_rentas_acto_concepto b on a.id_dcmnto = b.id_dcmnto',
'                                     and a.id_cncpto = b.id_cncpto',
'  join table (pkg_re_documentos.fnc_co_documento_detalle(a.id_dcmnto)) c on c.vgncia = c.vgncia                                  ',
' where  a.id_dcmnto = :P2_PRMTRO_2 --pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_DCMNTO'')',
'group by a.id_cncpto, b.dscrpcion_cncpto, b.txto_trfa, b.cdgo_cncpto, a.vlor_dbe,b.nmbre_impsto_acto;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(121227904675139553)
,p_shared_query_id=>wwv_flow_api.id(79652923146643828)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--3. Totales Recibo de Pago Rentas',
'select   to_char(vlor_cptal, :F_FRMTO_MNDA) vlor_cptal ',
'    ,    to_char(nvl(vlor_intres,0), :F_FRMTO_MNDA) vlor_intres',
'    ,    to_char(nvl(vlor_dscnto,0), :F_FRMTO_MNDA) vlor_dscnto ',
'    ,    to_char((vlor_cptal + nvl(vlor_intres,0) - nvl(vlor_dscnto,0)), :F_FRMTO_MNDA) vlor_ttal',
'   from (',
'            select  (a.vlor_dbe + a.vlor_hber) vlor',
'                ,   a.cdgo_cncpto_tpo                        ',
'              from  re_g_documentos_detalle a',
'              join  gi_g_rentas b on a.id_dcmnto = b.id_dcmnto',
'             where  a.id_dcmnto = :P2_PRMTRO_2-- pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_DCMNTO'')',
'        ) pivot',
'        (sum(nvl(vlor,0)) ',
'         for cdgo_cncpto_tpo in (''C'' as vlor_cptal, ''I'' as vlor_intres, ''D'' vlor_dscnto)',
'        )'))
);
end;
/
