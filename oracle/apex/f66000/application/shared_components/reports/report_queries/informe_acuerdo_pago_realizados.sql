prompt --application/shared_components/reports/report_queries/informe_acuerdo_pago_realizados
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(22462164146324041)
,p_name=>'informe_acuerdo_pago_realizados'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select d.id_impsto',
'        , c.id_cncpto',
'        , d.dscrpcion',
'        , count(a.id_cnvnio)                            cntdad_acrdos',
'        , sum(c.vlor_cptal)                             ttal_cptal_ap',
'        , sum(c.vlor_intres)                            ttal_intres_ap',
'        , sum(c.vlor_cptal) + sum(c.vlor_intres)        ttal_ap',
'        , sum(e.vlor_sldo_cptal)                        ttal_cptal_pgar',
'        , sum(e.vlor_intres)                            ttal_intres_pgar',
'        , sum(e.vlor_sldo_cptal) + sum(e.vlor_intres)   ttal_pgar',
'        --*',
'     from gf_g_convenios            a',
'     join gf_g_convenios_cartera    c on a.id_cnvnio        = c.id_cnvnio',
'     join df_i_conceptos            d on c.id_cncpto        = d.id_cncpto',
'     join gf_g_mvmntos_cncpto_cnslddo e on a.id_sjto_impsto   = e.id_sjto_impsto',
'      and c.id_cncpto               = e.id_cncpto',
'    where a.cdgo_clnte              = :P_CDGO_CLNTE',
'      and a.cdgo_cnvnio_estdo       = ''APL''',
'      and trunc(a.fcha_slctud)      between :P_FCHA_INCIO and :P_FCHA_FIN',
' group by d.id_impsto',
'        , c.id_cncpto',
'        , d.dscrpcion',
' order by d.id_impsto',
'        , c.id_cncpto'))
,p_format=>'PDF'
,p_output_file_name=>'informe_acuerdo_pago_realizados'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22649222325639358)
,p_shared_query_id=>wwv_flow_api.id(22462164146324041)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select n001  orden',
'        , c001  nmbre_impsto',
'        , c002  cntdad_acrdos',
'        , c003  dscrpcion',
'        , trim(to_char(c004, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(c005, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(c006, ''999G999G999G999G999''))  ttal_ap',
'        , trim(to_char(c007, ''999G999G999G999G999''))  ttal_cptal_pgar',
'        , trim(to_char(c008, ''999G999G999G999G999''))  ttal_intres_pgar',
'        , trim(to_char(c009, ''999G999G999G999G999'')) ttal_pgar',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 < 3',
' order by nmbre_impsto',
'        , orden',
'        , dscrpcion;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22649458557639358)
,p_shared_query_id=>wwv_flow_api.id(22462164146324041)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select n001  orden',
'        , c001  nmbre_impsto',
'        , c002  cntdad_acrdos',
'        , c003  dscrpcion',
'        , trim(to_char(c004, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(c005, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(c006, ''999G999G999G999G999''))  ttal_ap',
'        , trim(to_char(c007, ''999G999G999G999G999''))  ttal_cptal_pgar',
'        , trim(to_char(c008, ''999G999G999G999G999''))  ttal_intres_pgar',
'        , trim(to_char(c009, ''999G999G999G999G999'')) ttal_pgar',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 = 3',
' order by nmbre_impsto',
'        , orden',
'        , dscrpcion;'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(22649670746639358)
,p_shared_query_id=>wwv_flow_api.id(22462164146324041)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select upper(b.nmbre_clnte)nmbre_clnte',
'        , upper(b.slgan)slgan',
'        , pkg_gn_generalidades.fnc_cl_convertir_blob_a_base64( p_blob => a.file_blob ) as lgo_slgan',
'        , to_char(systimestamp, ''DD/MM/YYYY HH:MM:SS AM'') HOY',
'        , :F_IP as ipaddr',
'        , :F_NMBRE_USRIO        as Usuario     ',
'        , a.file_mimetype',
'        , json_value(:P37_JSON ,''$.fcha_incial'' )          as fcha_incial',
'        , json_value(:P37_JSON ,''$.fcha_fnal'' )            as fcha_fnal',
'        , upper(json_value(:P37_JSON ,''$.nmbre_rprte'' ))   as nmbre_rprte',
'     from df_c_imagenes_cliente a',
'     join df_s_clientes         b on a.cdgo_clnte = b.cdgo_clnte ',
'    where a.cdgo_clnte          = :F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte    = ''L_E'''))
);
end;
/
