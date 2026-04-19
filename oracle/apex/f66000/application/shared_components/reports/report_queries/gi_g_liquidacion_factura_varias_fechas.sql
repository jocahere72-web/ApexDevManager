prompt --application/shared_components/reports/report_queries/gi_g_liquidacion_factura_varias_fechas
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(38418227306831233)
,p_name=>'gi_g_liquidacion_factura_varias_fechas'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select upper(b.nmbre_clnte)nmbre_clnte,',
'		upper(b.slgan)slgan,',
'		pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'		to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'		:F_IP as ipaddr,',
'		(select upper(nmbre_impsto) from df_c_impuestos m where m.id_impsto = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_IMPSTO'' ) )nmbre_impsto,',
'		(select upper(nmbre_rprte) from gn_d_reportes m where m.id_rprte = pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_RPRTE'' ) )nmbre_rpte,',
'		:F_NMBRE_USRIO as Usuario,       ',
'		a.file_mimetype',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
,p_format=>'PDF'
,p_output_file_name=>'gi_g_liquidacion_factura_varias_fechas'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(48866740588246505)
,p_shared_query_id=>wwv_flow_api.id(38418227306831233)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select --Datos de encabezado',
'        upper(i.nmbre_clnte)nmbre_clnte,',
'		upper(i.slgan)slgan,',
'		pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => j.file_blob ) as lgo_slgan,',
'		to_char(systimestamp, ''DD/MON/YYYY'') HOY,',
'		:F_IP as ipaddr,',
'		:F_NMBRE_USRIO as Usuario,       ',
'		j.file_mimetype,        ',
'        row_number() over(partition by a.id_dtrmncion order by c.id_dtrmncion)                 nmro_rgstro,',
unistr('        -- Datos de la determinaci\00F3n'),
'        d.id_dcmnto,',
'        a.id_dtrmncion,',
'        a.fcha_dtrmncion,',
'        upper(a.nmbre_impsto) nmbre_impsto,',
'        a.nmro_acto,',
'        a.dscrpcion_dcrto_jstfccion_frma,',
'        -- Datos del Sujeto impuesto',
'        a.idntfccion_sjto_frmtda,',
'        a.drccion,',
'        a.drccion_ntfccion,',
'        e.area_trrno    || '' '' || ''Mts2''                                                       area_trrno,',
'        e.area_cnstrda  || '' '' || ''Mts2''                                                       area_cnstrda,',
'        nvl2(e.mtrcla_inmblria,             upper(e.mtrcla_inmblria),''No Definido'')            mtrcla_inmblria,',
'        nvl2(e.dscrpcion_prdo_dstno,        upper(e.dscrpcion_prdo_dstno),''No Definido'')       dscrpcion_prdo_dstno,',
'        nvl2(e.dscrpcion_estrto,            upper(e.dscrpcion_estrto),''No Definido'')           dscrpcion_estrto,',
'        nvl2(e.dscrpcion_prdio_clsfccion,   upper(e.dscrpcion_prdio_clsfccion),''No Definido'')  dscrpcion_prdio_clsfccion,',
'        -- Datos de los responsables',
'        (select listagg (nmbre_rzon_scial, '', '') within group (order by id_dcmnto)  ',
'           from v_re_g_documentos_responsable m',
'          where m.id_dcmnto = c.id_dcmnto)                                                      nmbre_rspnsbles,',
'        (select listagg (nmtcnco_idntfccion_tpo || '' '' || idntfccion, '', '') within group (order by id_dcmnto)  ',
'           from v_re_g_documentos_responsable n',
'          where n.id_dcmnto = c.id_dcmnto)                                                      idntfccion_rspnsbles,',
'        -- Datos de Documento',
'        d.nmro_dcmnto,',
'        to_char(d.fcha_vncmnto, ''DD/MM/YYYY'') fcha_vncmnto,',
'        upper(''HASTA''|| '' '' || pkg_gn_generalidades.fnc_cl_fecha_texto(d.fcha_vncmnto))              fcha_vncmnto_hasta,',
'        f.vgncia_dscrpcion,',
'        f.vgncia,',
'        to_char(f.vlor_cptal,   :F_FRMTO_MNDA )                                                 vlor_cptal,       ',
'        to_char(f.vlor_intres,  :F_FRMTO_MNDA )                                                 vlor_intres,    ',
'        to_char(f.vlor_dscnto,  :F_FRMTO_MNDA )                                                 vlor_dscnto,   ',
'        to_char(f.vlor_ttal,    :F_FRMTO_MNDA )                                                 vlor_ttal ,',
'        -- Valores totales del documento',
'        to_char(g.vlor_cptal,   :F_FRMTO_MNDA )                                                 ttal_vlor_cptal,       ',
'        to_char(g.vlor_intres,  :F_FRMTO_MNDA )                                                 ttal_vlor_intres,    ',
'        to_char(g.vlor_dscnto,  :F_FRMTO_MNDA )                                                 ttal_vlor_dscnto,   ',
'        to_char(g.vlor_ttal,    :F_FRMTO_MNDA )                                                 ttal_vlor_ttal ,        ',
'        pkgbarcode.funcadfac(null,null, null, d.nmro_dcmnto, g.vlor_ttal, d.fcha_vncmnto, h.cdgo_ean, ''S'') txto_cdgo_brra,',
'        pkgbarcode.fungencod(''EANUCC128'',pkgbarcode.funcadfac(null,null, null, d.nmro_dcmnto,g.vlor_ttal, d.fcha_vncmnto, h.cdgo_ean, ''N'' ) )cdgo_brra,',
'        -- Datos del Funcionario firma',
'        a.nmbre_trcro_fncnrio_frma,',
'        a.nmbre_crgo',
'  from v_gi_g_determinaciones                                               a',
'  join gi_g_determinaciones_lote                                            b on a.id_dtrmncion_lte     = b.id_dtrmncion_lte',
'  join gi_g_determinaciones_dcmnto                                          c on a.id_dtrmncion         = c.id_dtrmncion',
'  join re_g_documentos                                                      d on c.id_dcmnto            = d.id_dcmnto and b.id_dcmnto_lte = d.id_dcmnto_lte',
'  join v_si_i_predios                                                       e on a.id_sjto_impsto       = e.id_sjto_impsto',
'  join table (pkg_re_documentos.fnc_cl_dcmnto_dtlle_acmldo_v2(c.id_dcmnto)) f on f.vgncia_dscrpcion     = f.vgncia_dscrpcion',
'  join table (pkg_re_documentos.fnc_cl_documento_total(c.id_dcmnto))        g on g.id_dcmnto            = g.id_dcmnto',
'  join df_i_impuestos_subimpuesto                                           h on a.id_impsto_sbmpsto    = h.id_impsto_sbmpsto',
'  join df_s_clientes                                                        i on a.cdgo_clnte           = i.cdgo_clnte ',
'  join df_c_imagenes_cliente                                                j on a.cdgo_clnte           = j.cdgo_clnte and j.cdgo_imgen_clnte = ''L_E''',
' where b.id_dtrmncion_lte        = pkg_gn_generalidades.fnc_ca_extract_value    ( p_xml => :P2_XML , p_nodo => ''P_ID_DTRMNCION_LTE'' )',
'   and a.id_dtrmncion            = nvl(pkg_gn_generalidades.fnc_ca_extract_value( p_xml => :P2_XML , p_nodo => ''P_ID_DTRMNCION'' ), a.id_dtrmncion )',
'   and d.nmro_dcmnto  between nvl(pkg_gn_generalidades.fnc_ca_extract_value     ( p_xml => :P2_XML , p_nodo => ''P_RANGO_INICIO'' ), d.nmro_dcmnto ) ',
'                              and nvl(pkg_gn_generalidades.fnc_ca_extract_value ( p_xml => :P2_XML , p_nodo => ''P_RANGO_FIN'' ), d.nmro_dcmnto )',
'  order by d.nmro_dcmnto, d.fcha_vncmnto;'))
);
end;
/
