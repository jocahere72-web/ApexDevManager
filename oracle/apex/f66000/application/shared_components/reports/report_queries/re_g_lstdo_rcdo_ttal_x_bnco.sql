prompt --application/shared_components/reports/report_queries/re_g_lstdo_rcdo_ttal_x_bnco
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(18452612271203087)
,p_name=>'re_g_lstdo_rcdo_ttal_x_bnco'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_bnco',
'            , a.nmbre_bnco',
'            , count(*) as nmro_rcdos',
'            , sum(b.vlor) as ttal_rcdos',
'            , sum(b.vlor) as ttal_bnco',
'            , 0 as otros_rcdos',
'         from v_re_g_recaudos_control a',
'         join re_g_recaudos b',
'           on a.id_rcdo_cntrol  = b.id_rcdo_cntrol',
'        where a.cdgo_clnte        = :F_CDGO_CLNTE',
'          and a.id_impsto         = nvl( pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :xml',
'                                                                                  , p_nodo => ''id_impsto'' ) , a.id_impsto )',
'          and a.id_impsto_sbmpsto = nvl( pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :xml',
'                                                                                  , p_nodo => ''id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'          and b.fcha_rcdo between pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :xml',
'                                                                           , p_nodo => ''fcha_incial'' )',
'          and pkg_gn_generalidades.fnc_ca_extract_value( p_xml  => :xml',
'                                                       , p_nodo => ''fcha_fnal'' )',
'          and b.cdgo_rcdo_estdo = ''AP''',
'     group by a.id_bnco',
'            , a.nmbre_bnco'))
,p_format=>'PDF'
,p_output_file_name=>'re_g_lstdo_rcdo_ttal_x_bnco'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21587147334245409)
,p_shared_query_id=>wwv_flow_api.id(18452612271203087)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.id_bnco',
'            , a.nmbre_bnco',
'            , count(*) as nmro_rcdos',
'            , sum(b.vlor) as ttal_rcdos',
'            , sum(b.vlor) as ttal_bnco',
'            , 0 as otros_rcdos',
'            , json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial',
'            , json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal',
'            , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte ',
'            , a.nmbre_impsto',
'         from v_re_g_recaudos_control a',
'         join re_g_recaudos b',
'           on a.id_rcdo_cntrol  = b.id_rcdo_cntrol',
'        where a.cdgo_clnte        = :F_CDGO_CLNTE',
'          and a.id_impsto         = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
'          and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'          and b.fcha_rcdo between json_value(:P37_JSON ,''$.fcha_incial'' )',
'                              and json_value(:P37_JSON ,''$.fcha_fnal'' )',
'          and b.cdgo_rcdo_estdo = ''AP''',
'           and a.id_bnco = nvl( json_value(:P37_JSON ,''$.id_bnco'' ) , a.id_bnco )',
'     group by a.id_bnco',
'            , a.nmbre_bnco',
'            , a.nmbre_impsto'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(21587364159245409)
,p_shared_query_id=>wwv_flow_api.id(18452612271203087)
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
