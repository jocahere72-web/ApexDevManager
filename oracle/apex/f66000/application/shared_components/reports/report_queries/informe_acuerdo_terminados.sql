prompt --application/shared_components/reports/report_queries/informe_acuerdo_terminados
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(25307188713858808)
,p_name=>'informe_acuerdo_terminados'
,p_query_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
'    where a.cdgo_clnte          = 23001--:F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte    = ''L_E'' '))
,p_format=>'PDF'
,p_output_file_name=>'informe_acuerdo_terminados'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25567792950032508)
,p_shared_query_id=>wwv_flow_api.id(25307188713858808)
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
'      and a.cdgo_imgen_clnte    = ''L_E'' '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25567916569032508)
,p_shared_query_id=>wwv_flow_api.id(25307188713858808)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n001  orden',
'        , c001  nmbre_impsto',
'        , c007  nmro_acrdo',
'        , c008  nmro_ctas',
'        , c009  ttla_ctas_pgdas',
'        , c002  cntdad_acrdos',
'        , c003  dscrpcion',
'        , trim(to_char(c004, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(c005, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(c006, ''999G999G999G999G999''))  ttal_ap',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 = 1',
' order by nmbre_impsto',
'        , orden',
'        , nmro_acrdo',
'        , dscrpcion'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25568198635032508)
,p_shared_query_id=>wwv_flow_api.id(25307188713858808)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n001  orden',
'        , c001  nmbre_impsto',
'        , c007  nmro_acrdo',
'        , c008  nmro_ctas',
'        , c009  ttla_ctas_pgdas',
'        , c002  cntdad_acrdos',
'        , c003  dscrpcion',
'        , trim(to_char(c004, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(c005, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(c006, ''999G999G999G999G999''))  ttal_ap',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 = 2',
' order by nmbre_impsto',
'        , orden',
'        , nmro_acrdo',
'        , dscrpcion'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25568335943032508)
,p_shared_query_id=>wwv_flow_api.id(25307188713858808)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select n001  orden',
'        , c001  nmbre_impsto',
'        , c007  nmro_acrdo',
'        , c008  nmro_ctas',
'        , c009  ttla_ctas_pgdas',
'        , c002  cntdad_acrdos',
'        , c003  dscrpcion',
'        , trim(to_char(c004, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(c005, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(c006, ''999G999G999G999G999''))  ttal_ap',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 = 3',
' order by nmbre_impsto',
'        , orden',
'        , nmro_acrdo',
'        , dscrpcion'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25568538694032508)
,p_shared_query_id=>wwv_flow_api.id(25307188713858808)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(distinct b.id_cnvnio) tal_cnvnio',
'       from gf_g_convenios                  a',
'       join gf_g_convenios_cartera          b on a.id_cnvnio          = b.id_cnvnio',
'       join gf_g_mvmntos_cncpto_cnslddo     d on a.id_sjto_impsto     = d.id_sjto_impsto',
'        and b.vgncia                        = d.vgncia',
'        and b.id_prdo                       = d.id_prdo',
'        and b.id_cncpto                     = d.id_cncpto',
'        and d.vlor_sldo_cptal               = 0',
'      where a.cdgo_clnte                    = :F_CDGO_CLNTE',
'        and a.cdgo_cnvnio_estdo             = ''FNL'''))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25568783183032508)
,p_shared_query_id=>wwv_flow_api.id(25307188713858808)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select c003  dscrpcion',
'        , trim(to_char(sum(c004), ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(sum(c005), ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char(sum(c006), ''999G999G999G999G999''))  ttal_ap',
'     from gn_g_temporal ',
'    where id_ssion = :APP_SESSION',
'      and n001 = 1',
' group by c003',
' order by dscrpcion'))
);
end;
/
