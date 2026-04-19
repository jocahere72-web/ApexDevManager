prompt --application/shared_components/reports/report_queries/re_g_lstdo_rcdo_aplcdo_y_n_aplcdo
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(21824627860309587)
,p_name=>'re_g_lstdo_rcdo_aplcdo_y_n_aplcdo'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_bnco',
'       , a.dscrpcion_bnco',
'       , a.nmro_cnta',
'       , b.nmro_dcmnto',
'       , b.idntfccion_sjto_frmtda',
'       , trim(c.prmer_nmbre || '' '' || c.sgndo_nmbre || '' '' || c.prmer_aplldo || '' '' || c.sgndo_aplldo ) as rspnsble',
'       , to_char( b.fcha_rcdo , ''DD/MM/YYYY'' ) as fcha_rcdo',
'       , b.vlor',
'       , upper(a.nmbre_impsto) as nmbre_impsto      ',
'       , pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''fcha_incial'' ) as fcha_incial',
'       , pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''fcha_fnal'' ) as fcha_fnal',
'       , upper(pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML, p_nodo => ''nmbre_rprte '' )) as nmbre_rprte',
'       , b.id_rcdo_cntrol',
'       , decode( b.cdgo_rcdo_estdo , ''AP'' , ''S'' , ''N'' ) as indcdor_aplcdo',
'    from v_re_g_recaudos_control a',
'    join v_re_g_recaudos b',
'      on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'    join si_i_sujetos_responsable c',
'      on b.id_sjto_impsto = c.id_sjto_impsto',
'     and c.prncpal_s_n    = ''S''',
'   where a.cdgo_clnte          = :F_CDGO_CLNTE',
'     and a.id_impsto         = nvl( pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                                             , p_nodo => ''id_impsto'' ) , a.id_impsto )',
'     and a.id_impsto_sbmpsto = nvl( pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                                             , p_nodo => ''id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'     and trunc(b.fcha_rcdo) between pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                                             , p_nodo => ''fcha_incial'' )',
'     and pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                  , p_nodo => ''fcha_fnal'' )',
'     and b.cdgo_rcdo_estdo in ( ''AP'' , ''RG'' )',
'     and a.id_bnco = nvl( pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                                             , p_nodo => ''id_bnco'' ) , a.id_bnco )',
'order by a.nmbre_bnco',
'       , b.fcha_rcdo',
'       , b.idntfccion_sjto',
'       , b.id_rcdo_cntrol'))
,p_format=>'PDF'
,p_output_file_name=>'re_g_lstdo_rcdo_aplcdo_y_n_aplcdo'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21576598508188592)
,p_shared_query_id=>wwv_flow_api.id(21824627860309587)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.cdgo_bnco',
'       , a.dscrpcion_bnco',
'       , a.nmro_cnta',
'       , b.nmro_dcmnto',
'       , b.idntfccion_sjto_frmtda',
'       , trim(c.prmer_nmbre || '' '' || c.sgndo_nmbre || '' '' || c.prmer_aplldo || '' '' || c.sgndo_aplldo ) as rspnsble',
'       , to_char( b.fcha_rcdo , ''DD/MM/YYYY'' ) as fcha_rcdo',
'       , b.vlor',
'       , upper(a.nmbre_impsto) as nmbre_impsto      ',
'       , json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial',
'       , json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal',
'       , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'       , b.id_rcdo_cntrol',
unistr('       , decode( b.cdgo_rcdo_estdo , ''AP'' , ''S\00ED'' , ''No'' ) as indcdor_aplcdo'),
'    from v_re_g_recaudos_control a',
'    join v_re_g_recaudos b',
'      on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'    join si_i_sujetos_responsable c',
'      on b.id_sjto_impsto = c.id_sjto_impsto',
'     and c.prncpal_s_n    = ''S''',
'   where a.cdgo_clnte          = :F_CDGO_CLNTE',
'     and a.id_impsto         = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
'     and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'     and trunc(b.fcha_rcdo) between json_value(:P37_JSON ,''$.fcha_incial'' )',
'                                and json_value(:P37_JSON ,''$.fcha_fnal'' )',
'     and b.cdgo_rcdo_estdo in ( ''AP'' , ''RG'' )',
'     and a.id_bnco = nvl( json_value(:P37_JSON ,''$.id_bnco'' ) , a.id_bnco )',
'order by a.nmbre_bnco',
'       , b.fcha_rcdo',
'       , b.idntfccion_sjto',
'       , b.id_rcdo_cntrol'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21576731478188592)
,p_shared_query_id=>wwv_flow_api.id(21824627860309587)
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
end;
/
