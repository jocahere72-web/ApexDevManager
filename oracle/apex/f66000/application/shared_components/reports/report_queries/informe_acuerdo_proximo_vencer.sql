prompt --application/shared_components/reports/report_queries/informe_acuerdo_proximo_vencer
begin
wwv_flow_api.create_shared_query(
 p_id=>wwv_flow_api.id(25346051020550736)
,p_name=>'informe_acuerdo_proximo_vencer'
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
'    where a.cdgo_clnte          = :F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte    = ''L_E'' '))
,p_format=>'PDF'
,p_output_file_name=>'informe_acuerdo_proximo_vencer'
,p_content_disposition=>'ATTACHMENT'
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25360697725690556)
,p_shared_query_id=>wwv_flow_api.id(25346051020550736)
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
'    where a.cdgo_clnte          = 23001--:F_CDGO_CLNTE',
'      and a.cdgo_imgen_clnte    = ''L_E'' '))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25360865672690556)
,p_shared_query_id=>wwv_flow_api.id(25346051020550736)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_impsto',
'        , a.nmro_cnvnio',
'        , b.nmro_cta',
'        , trim(to_char(b.vlor_cptal, ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(b.vlor_intres, ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char((b.vlor_cptal + b.vlor_intres), ''999G999G999G999G999''))  ttal_ap',
'     from v_gf_g_convenios              a',
'     join v_gf_g_convenios_extracto     b on a.id_cnvnio = b.id_cnvnio',
'    where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'      and b.estdo_cta                   = ''ADEUDADA''',
'      and b.actvo                       = ''S''',
'      and trunc(b.fcha_vncmnto)         <= trunc(to_date(json_value(:P37_JSON ,''$.fcha_incial'' )))',
' order by a.nmbre_impsto',
'        , a.nmro_cnvnio',
'        , b.nmro_cta'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25361040498690556)
,p_shared_query_id=>wwv_flow_api.id(25346051020550736)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select count(distinct a.id_cnvnio)   ttal_cnvnio',
'     from v_gf_g_convenios              a',
'     join v_gf_g_convenios_extracto     b on a.id_cnvnio = b.id_cnvnio',
'    where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'      and b.estdo_cta                   = ''ADEUDADA''',
'      and b.actvo                       = ''S''',
'      and trunc(b.fcha_vncmnto)         <= trunc(to_date(json_value(:P37_JSON ,''$.fcha_incial'' )))'))
);
wwv_flow_api.create_shared_query_stmnt(
 p_id=>wwv_flow_api.id(25361261857690557)
,p_shared_query_id=>wwv_flow_api.id(25346051020550736)
,p_sql_statement=>wwv_flow_string.join(wwv_flow_t_varchar2(
'   select a.nmbre_impsto',
'        , trim(to_char(sum(b.vlor_cptal), ''999G999G999G999G999''))  ttal_cptal_ap',
'        , trim(to_char(sum(b.vlor_intres), ''999G999G999G999G999''))  ttal_intres_ap',
'        , trim(to_char((sum(b.vlor_cptal + b.vlor_intres)), ''999G999G999G999G999''))  ttal_ap',
'     from v_gf_g_convenios              a',
'     join v_gf_g_convenios_extracto     b on a.id_cnvnio = b.id_cnvnio',
'    where a.cdgo_clnte                  = :F_CDGO_CLNTE',
'      and b.estdo_cta                   = ''ADEUDADA''',
'      and b.actvo                       = ''S''',
'      and trunc(b.fcha_vncmnto)         <= trunc(to_date(json_value(:P37_JSON ,''$.fcha_incial'' )))',
' group by a.nmbre_impsto',
' order by a.nmbre_impsto'))
);
end;
/
