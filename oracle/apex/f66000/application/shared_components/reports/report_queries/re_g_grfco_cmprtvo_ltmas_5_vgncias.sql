prompt --application/shared_components/reports/report_queries/re_g_grfco_cmprtvo_ltmas_5_vgncias
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(21479566898752490)
,p_name=>'re_g_grfco_cmprtvo_ltmas_5_vgncias'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--Consulta que trae el valor capital de cada vigencia',
'select sum(a.vlor_cptal) as vlor_cptal  ',
'     , a.vgncia',
'    ',
' from ',
'   ( ',
'       select  sum( b.vlor_cptal ) as vlor_cptal',
'             , b.vgncia',
'            ',
'          from re_g_recaudos_control a',
'              join v_re_g_recaudos_dtlle b',
'                on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                where    a.cdgo_clnte        = :F_CDGO_CLNTE',
'                  and a.id_impsto         = nvl( pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                                                          , p_nodo => ''id_impsto'' ) , a.id_impsto )',
'                  and a.id_impsto_sbmpsto = nvl( pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                                                          , p_nodo => ''id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'                  and b.fcha_rcdo between pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                                                   , p_nodo => ''fcha_incial'' )',
'                  and pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                               , p_nodo => ''fcha_fnal'' )',
'                  and a.id_bnco = nvl( pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :P2_XML',
'                                                                              , p_nodo => ''id_bnco'' ) , a.id_bnco )',
'        group by a.id_bnco_cnta',
'               , b.vgncia',
'    )a ',
'    where a.vgncia>=a.vgncia-5',
'  ',
'group by  a.vgncia    '))
,p_format=>'PDF'
,p_output_file_name=>'re_g_grfco_cmprtvo_ltmas_5_vgncias'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22341769297838999)
,p_shared_query_id=>wwv_flow_api.id(21479566898752490)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select sum(a.vlor_cptal) as vlor_cptal',
'     , sum( a.vlor_intres ) as vlor_intres',
'     , sum( a.vlor_ttal ) as vlor_ttal',
'     , a.vgncia',
'     , a.id_impsto',
'     , a.nmbre_impsto',
'     , json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial',
'     , json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal',
'     , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'    ',
' from ',
'   ( ',
'       select  sum( b.vlor_cptal ) as vlor_cptal',
'             , sum( b.vlor_intres ) as vlor_intres',
'             , sum(  b.vlor_cptal + b.vlor_intres ) as vlor_ttal',
'             , b.vgncia',
'             , a.id_impsto',
'             , a.nmbre_impsto',
'            ',
'          from v_re_g_recaudos_control a',
'              join v_re_g_recaudos_detalle b',
'                on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                where a.cdgo_clnte        = :F_CDGO_CLNTE',
'                  and a.id_impsto         = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
'                  and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'                  and b.fcha_rcdo between json_value(:P37_JSON ,''$.fcha_incial'' )',
'                              and json_value(:P37_JSON ,''$.fcha_fnal'' )',
'                  and a.id_bnco = nvl( json_value(:P37_JSON ,''$.id_bnco'' ) , a.id_bnco )',
'                  and b.vgncia >= to_char(sysdate,''YYYY'') - 5  ',
'        group by b.vgncia',
'               , a.id_impsto',
'               , a.nmbre_impsto',
'    )a       ',
'group by  a.vgncia',
'        , a.nmbre_impsto',
'        , a.id_impsto',
'        , json_value(:P37_JSON ,''$.fcha_incial'' )  ',
'        , json_value(:P37_JSON ,''$.fcha_fnal'' )  ',
'        , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))            ',
'order by a.nmbre_impsto',
'       , a.vgncia'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22341943564839002)
,p_shared_query_id=>wwv_flow_api.id(21479566898752490)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr(' -- Encabezado y Pie de P\00E1gina'),
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
 p_id=>wwv_flow_api.id(22342194323839002)
,p_shared_query_id=>wwv_flow_api.id(21479566898752490)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sum(a.vlor_sldo_fvor) as vlor_sldo_fvor',
'     , a.id_impsto',
'     , a.nmbre_impsto',
' from ',
'   ( ',
'       select   sum(b.vlor_sldo_fvor) as vlor_sldo_fvor',
'             , a.id_impsto',
'             , a.nmbre_impsto            ',
'          from v_re_g_recaudos_control a',
'              join v_re_g_recaudos_detalle b',
'                on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                where    a.cdgo_clnte        = :F_CDGO_CLNTE',
'                  and a.id_impsto         = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
'                  and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'                  and b.fcha_rcdo between json_value(:P37_JSON ,''$.fcha_incial'' )',
'                              and json_value(:P37_JSON ,''$.fcha_fnal'' )',
'                  and a.id_bnco = nvl( json_value(:P37_JSON ,''$.id_bnco'' ) , a.id_bnco )',
'                  --and b.vgncia >= to_char(sysdate,''YYYY'')-5',
'        group by a.id_impsto',
'               , a.nmbre_impsto',
'    )a      ',
'group by   a.vlor_sldo_fvor',
'         , a.id_impsto',
'         , a.nmbre_impsto         ',
'order by a.nmbre_impsto'))
);
end;
/
