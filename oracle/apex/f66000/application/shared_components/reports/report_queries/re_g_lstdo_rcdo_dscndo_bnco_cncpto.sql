prompt --application/shared_components/reports/report_queries/re_g_lstdo_rcdo_dscndo_bnco_cncpto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(19674308167742402)
,p_name=>'re_g_lstdo_rcdo_dscndo_bnco_cncpto'
,p_query_text=>'select * from dual'
,p_format=>'PDF'
,p_output_file_name=>'re_g_lstdo_rcdo_dscndo_bnco_cncpto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21573436062171949)
,p_shared_query_id=>wwv_flow_api.id(19674308167742402)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.*',
'            , json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial',
'            , json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal',
'            , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte',
'         from (',
'                     select a.id_bnco',
'                          , a.cdgo_bnco',
'                          , a.dscrpcion_bnco',
'                          , a.nmbre_bnco',
'                          , a.nmro_cnta',
'                          , a.id_bnco_cnta',
'                          , b.cdgo_cncpto',
'                          , b.dscrpcion_cncpto, sum( b.vlor_cptal ) as vlor_cptal',
'                          , sum( b.vlor_intres ) as vlor_intres',
'                          , sum(( b.vlor_cptal + b.vlor_intres )) as vlor_ttal',
'                          , decode( b.vgncia , /*extract( year from sysdate )*/ pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte 			     => :F_CDGO_CLNTE',
'                                                                                                                               , p_cdgo_dfncion_clnte_ctgria => ''GFN''',
'                                                                                                                               , p_cdgo_dfncion_clnte		 => ''VAC'' ) ',
'                                  , ''VIGENCIA ACTUAL'' , ''VIGENCIAS ANTERIORES'' ) as tpo',
'                       from v_re_g_recaudos_control a',
'                       join v_re_g_recaudos_detalle b',
'                         on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                      where a.cdgo_clnte     = :F_CDGO_CLNTE',
'                        and b.vlor_cptal    <> 0',
'                        and a.id_impsto         = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
'                        and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'                        and b.fcha_rcdo between json_value(:P37_JSON ,''$.fcha_incial'' )',
'                                            and json_value(:P37_JSON ,''$.fcha_fnal'' )',
'                        and a.id_bnco = nvl( json_value(:P37_JSON ,''$.id_bnco'' ) , a.id_bnco )',
'                   group by a.id_bnco',
'                          , a.cdgo_bnco',
'                          , a.dscrpcion_bnco',
'                          , a.nmbre_bnco',
'                          , a.nmro_cnta',
'                          , a.id_bnco_cnta',
'                          , b.cdgo_cncpto',
'                          , b.dscrpcion_cncpto',
'                          , decode( b.vgncia , /*extract( year from sysdate )*/ pkg_gn_generalidades.fnc_cl_defniciones_cliente( p_cdgo_clnte 			     => :F_CDGO_CLNTE',
'                                                                                                                               , p_cdgo_dfncion_clnte_ctgria => ''GFN''',
'                                                                                                                               , p_cdgo_dfncion_clnte		 => ''VAC'' ) ',
'                                  , ''VIGENCIA ACTUAL'' , ''VIGENCIAS ANTERIORES'' ) ',
'              ) a',
'       order by a.nmbre_bnco',
'              , a.cdgo_bnco',
'              , a.nmro_cnta',
'              , tpo',
'              , a.cdgo_cncpto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21573646173171949)
,p_shared_query_id=>wwv_flow_api.id(19674308167742402)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  select a.id_bnco',
'       , a.cdgo_bnco',
'       , a.dscrpcion_bnco',
'       , a.nmbre_bnco',
'       , nvl(sum( b.vlor_sldo_fvor ),0)as vlor_sldo_fvor',
'    from v_re_g_recaudos_control a',
'    join v_re_g_recaudos_detalle b',
'      on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'   where a.cdgo_clnte        = :F_CDGO_CLNTE',
'     and a.id_impsto         = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
'     and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'     and b.fcha_rcdo between json_value(:P37_JSON ,''$.fcha_incial'' )',
'                         and json_value(:P37_JSON ,''$.fcha_fnal'' )',
'     and a.id_bnco = nvl( json_value(:P37_JSON ,''$.id_bnco'' ) , a.id_bnco )',
'group by a.id_bnco',
'       , a.cdgo_bnco',
'       , a.dscrpcion_bnco',
'       , a.nmbre_bnco',
'  having sum( b.vlor_sldo_fvor ) > 0',
'order by lpad( a.cdgo_bnco , 3 , 0 )'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21573814681171950)
,p_shared_query_id=>wwv_flow_api.id(19674308167742402)
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
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
