prompt --application/shared_components/reports/report_queries/re_g_lstdo_rcdo_x_mes_x_cncpto
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(83718455735947914)
,p_name=>'re_g_lstdo_rcdo_x_mes_x_cncpto'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. detalle del reporte',
'select x.*',
'     , sum(x.vlor_ttal) over ( partition by x.cncpto ) as ttal_cncpto',
'     , sum(x.vlor_ttal) over () as ttal_gnral',
'  from (',
'            select extract (month from b.fcha_rcdo) ||'' - ''|| to_char(b.fcha_rcdo, ''Month'') as mes',
'                          , b.cdgo_cncpto ||'' - ''|| b.dscrpcion_cncpto as cncpto',
'                          , sum( b.vlor_cptal )                        as vlor_cptal',
'                          , sum( b.vlor_intres )                       as vlor_intres',
'                          , sum(( b.vlor_cptal + b.vlor_intres ))      as vlor_ttal',
'                       from v_re_g_recaudos_control a',
'                       join v_re_g_recaudos_detalle b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                      where a.cdgo_clnte        = :F_CDGO_CLNTE',
'                        and a.id_impsto         = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
'                        and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'                        --and b.cdgo_cncpto       = nvl( json_value(:P37_JSON ,''$.cdgo_cncpto'' ) , b.cdgo_cncpto )',
'                        and trunc(b.fcha_rcdo)  between json_value(:P37_JSON ,''$.fcha_incial'' )    ',
'                                                    and json_value(:P37_JSON ,''$.fcha_fnal'' )',
'                        and a.id_bnco           = nvl( json_value(:P37_JSON ,''$.id_bnco'' ) , a.id_bnco ) ',
'                   group by b.cdgo_cncpto ||'' - ''|| b.dscrpcion_cncpto',
'                          , extract (month from b.fcha_rcdo) ||'' - ''|| to_char(b.fcha_rcdo, ''Month'')',
'       ) x',
' order by 2,1;'))
,p_format=>'PDF'
,p_output_file_name=>'re_g_lstdo_rcdo_x_mes_x_cncpto'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(84133645342045060)
,p_shared_query_id=>wwv_flow_api.id(83718455735947914)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--1. detalle del reporte',
'select x.*',
'     , sum(x.vlor_ttal) over ( partition by x.cncpto ) as ttal_cncpto',
'     , sum(x.vlor_ttal) over () as ttal_gnral',
'  from (',
'                     select a.id_impsto',
'                          , upper(a.nmbre_impsto)                                                    as nmbre_impsto',
'                          , upper(a.nmbre_impsto_sbmpsto)                                            as nmbre_impsto_sbmpsto',
'                          , extract (month from b.fcha_rcdo) ||'' - ''|| to_char(b.fcha_rcdo, ''Month'') as mes',
'                          , b.cdgo_cncpto ||'' - ''|| upper(b.dscrpcion_cncpto)                        as cncpto',
'                          , round(sum( b.vlor_cptal ))                                               as vlor_cptal',
'                          , round(sum( b.vlor_intres))                                               as vlor_intres',
'                          , round(sum( b.vlor_ttal ))                                                as vlor_ttal',
'                       from v_re_g_recaudos_control a',
'                       join v_re_g_recaudos_detalle b on a.id_rcdo_cntrol = b.id_rcdo_cntrol',
'                      where a.cdgo_clnte        = :F_CDGO_CLNTE',
'                        and a.id_impsto         = nvl( json_value(:P37_JSON ,''$.id_impsto'' ) , a.id_impsto )',
'                        and a.id_impsto_sbmpsto = nvl( json_value(:P37_JSON ,''$.id_impsto_sbmpsto'' ) , a.id_impsto_sbmpsto )',
'                        --and b.cdgo_cncpto       = nvl( json_value(:P37_JSON ,''$.cdgo_cncpto'' ) , b.cdgo_cncpto )',
'                        and trunc(b.fcha_rcdo)  between json_value(:P37_JSON ,''$.fcha_incial'' )    ',
'                                                    and json_value(:P37_JSON ,''$.fcha_fnal'' )',
'                        and a.id_bnco           = nvl( json_value(:P37_JSON ,''$.id_bnco'' ) , a.id_bnco ) ',
'                   group by a.id_impsto',
'                          , upper(a.nmbre_impsto)',
'                          , upper(a.nmbre_impsto_sbmpsto)',
'                          , b.cdgo_cncpto ||'' - ''|| upper(b.dscrpcion_cncpto)',
'                          , extract (month from b.fcha_rcdo) ||'' - ''|| to_char(b.fcha_rcdo, ''Month'')',
'       ) x',
' order by 1,5,4;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(84133824517045060)
,p_shared_query_id=>wwv_flow_api.id(83718455735947914)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--2. Encabezado y Pie de pagina',
' select upper(b.nmbre_clnte)nmbre_clnte,',
'        upper(b.slgan)slgan,',
'        pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan,',
'        to_char(systimestamp, ''DD/MM/YYYY'') HOY,',
'        :F_IP as ipaddr,',
'        :F_NMBRE_USRIO as Usuario,       ',
'        a.file_mimetype,',
'        json_value(:P37_JSON ,''$.fcha_incial'' ) as fcha_incial,',
'        json_value(:P37_JSON ,''$.fcha_fnal'' ) as fcha_fnal,',
'        upper(json_value(:P37_JSON ,''$.nmbre_rprte'' )) as nmbre_rprte, ',
'        (',
'            select cdgo_frmto_tpo',
'              from gn_d_reportes where upper(nmbre_rprte) =  upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))',
'        ) as frmto',
'   from df_c_imagenes_cliente a',
'   join df_s_clientes b on a.cdgo_clnte = b.cdgo_clnte ',
'  where a.cdgo_clnte       = :F_CDGO_CLNTE',
'    and a.cdgo_imgen_clnte = ''L_E'''))
);
end;
/
